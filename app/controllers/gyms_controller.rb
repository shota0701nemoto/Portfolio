class GymsController < ApplicationController
    before_action :logged_in_user, only: [:show, :create, :destroy]
    before_action :correct_user,   only: :destroy

  def index


    #if logged_in?
        @gym  = current_user.gyms.build


        @gyms = Gym.paginate(page: params[:page])
      #end

  end

  def show
  #@gym = Gym.select("name")
  @gym = Gym.find(params[:id])
  @comment = Comment.new
  @comments = @gym.comments.paginate(page: params[:page], per_page: 10)

  end

  #ログインしたユーザーがジムを投稿する
  def create
   @gym = current_user.gyms.build(gym_params)
   if @gym.save
       flash[:success] = "投稿ありがとうございます!"
       redirect_to request.referrer ||  'gyms_path'
       else
               @feed_items = []
       render 'gyms/index'
       end
  end

  def destroy
    @gym.destroy
  flash[:success] = "ジムを削除しました"
  redirect_to request.referrer ||  'gyms_path'
  end

  private

     def gym_params
       params.require(:gym).permit(:name, :content)
     end

     def correct_user
       @gym = current_user.gyms.find_by(id: params[:id])
       redirect_to gyms_path if @gym.nil?
end
end
