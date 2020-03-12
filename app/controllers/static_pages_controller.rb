class StaticPagesController < ApplicationController
    
    def home
    if logged_in?
      @post  = current_user.posts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
      @carb = current_user.sum_of_carb_calorie
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
