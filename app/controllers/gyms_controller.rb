class GymsController < ApplicationController
  before_action :logged_in_user, only: [:show, :create, :destroy]
  before_action :correct_user,   only: :destroy

  def index
    @gym  = current_user.gyms.build
       #debugger
    @gyms = Gym.all.order(created_at: :desc)
  end

  def new
    @gym = gym.new
  end

  def show
    @gym = Gym.find(params[:id])
    @comment = Comment.new
    @comments = @gym.comments.paginate(page: params[:page], per_page: 10)
  end

  #ログインしたユーザーがジムを投稿する
  def create
    @gym = current_user.gyms.build(gym_params)
    @gym.picture = params[:picture]
    if @gym.save
      flash[:success] = "投稿ありがとうございます!"
      redirect_to request.referrer ||  'gyms_path'
    else
      render 'gyms/index'
    end
  end

  #投稿を削除
  def destroy
    @gym.destroy
    flash[:success] = "ジムを削除しました"
    redirect_to request.referrer ||  'gyms_path'
  end

  private

  def gym_params
    params.require(:gym).permit(
      :name,
      :content,
      {picture:[]}
    )
  end

  def correct_user
    @gym = current_user.gyms.find_by(id: params[:id])
    redirect_to gyms_path if @gym.nil?
  end
end
