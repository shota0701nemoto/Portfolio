class GymsController < ApplicationController
  before_action :logged_in_user, only: [:show, :create, :destroy]
  before_action :correct_user,   only: :destroy

  MAX_DISPLAY_RELATED_PRODUCTS = 4

  def index
       #debugger
    @gyms = Gym.paginate(page: params[:page], per_page: 18)
  end

  def new
    @gym = Gym.new
  end

  def show
    @gyms = Gym.all
    @gym = Gym.find(params[:id])
    @comment = Comment.new
    @comments = @gym.comments.paginate(page: params[:page], per_page: 10)
    @blogs = Blog.all
    @related_gyms = Gym.includes(:comments,:pictures).sample(MAX_DISPLAY_RELATED_PRODUCTS)
  end

  #ログインしたユーザーがジムを投稿する
  def create
      @gym = current_user.gyms.build(gym_params)
    @gym.picture = params[:picture]
    if @gym.save
      flash[:success] = "投稿ありがとうございます!"
      redirect_to request.referrer ||  'gyms_path'
    else
      flash[:errors] = @gym.errors.full_messages
      redirect_to request.referrer ||  'gyms_path'
    end
  end

  #投稿を削除
  def destroy
      Gym.find(params[:id]).destroy
    flash[:success] = "ジムを削除しました"
  redirect_to gyms_path
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
