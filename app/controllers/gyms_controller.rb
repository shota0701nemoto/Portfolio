class GymsController < ApplicationController
    before_action :logged_in_user, only: [:show, :create, :destroy]
    before_action :correct_user,   only: :destroy

  def index

    if logged_in?
        @gym  = current_user.gyms.build
        @feed_items = current_user.feed.paginate(page: params[:page])
      end

  end

  def show
  @gym = Gym.find(params[:id])
  end

  def create
   @gym = current_user.gyms.build(gym_params)
   if @gym.save
       flash[:success] = "投稿ありがとうございます!"
       redirect_to gyms_path
       else
       render 'gyms/show'
       end
  end

  def destroy
  end

  private

     def gym_params
       params.permit(:name, :content)
     end

end
