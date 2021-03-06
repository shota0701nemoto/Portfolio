# frozen_string_literal: true

class GymsController < ApplicationController
  before_action :logged_in_user, only: %i[show create destroy]
  before_action :correct_user,   only: :destroy
  MAX_DISPLAY_RELATED_GYMS = 4
  MAX_DISPLAY_RELATED_BLOGS = 5

  def index
    # debugger
    @users = User.all
    @gyms = Gym.paginate(page: params[:page], per_page: 6)
    @search = Gym.ransack(params[:q])
    @gym_search = @search.result
    @check = params[:q]
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
    @related_blogs = Blog.includes(:user).sample(MAX_DISPLAY_RELATED_BLOGS)
    @related_gyms = Gym.includes(:comments, :pictures).sample(MAX_DISPLAY_RELATED_GYMS)
    @like = Like.new
    @users = User.all
    #@user = User.where(id: params[:user_id]).last
    @user = @gym.user

    #@gym_user = @gym.user

    #@user = User.find(params[:id])
    #@user = User.find(1)
    #@user = User.find([:follow_id])

  end

  # ログインしたユーザーがジムを投稿する
  def create
    @gym = current_user.gyms.build(gym_params)
    @gym.picture = params[:picture]
    if @gym.save
      flash[:success] = '投稿ありがとうございます!'
      redirect_to request.referrer || 'gyms_show_path'
    else
      flash[:errors] = @gym.errors.full_messages
      redirect_to request.referrer || 'gyms_path'
    end
  end

  # 投稿を削除
  def destroy
    Gym.find(params[:id]).destroy
    flash[:success] = 'ジムを削除しました'
    redirect_to gyms_path
  end

  private

  def gym_params
    params.require(:gym).permit(
      :name,
      :content,
      picture: []
    )
  end

  def correct_user
    @gym = current_user.gyms.find_by(id: params[:id])
    redirect_to gyms_path if @gym.nil?
  end
end
