class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @comment = current_user.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comment.post_id = params[:post_id]
    if @comment.save
      #@comment.post.create_notification_comment!(current_user, @comment.id)
      flash[:success] = "コメントが投稿されました"
      redirect_back(fallback_location: root_path)
    else
      flash[:danger] = "正しく入力して下さい"
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    comment = current_user.comments.find_by(id: params[:id])
    if comment
      comment.destroy
      flash[:success] = "コメントを削除しました"
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:content)
    end
end
