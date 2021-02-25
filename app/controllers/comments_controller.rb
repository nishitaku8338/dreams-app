class CommentsController < ApplicationController
  def create
    Comment.create(comment_params)
    redirect_back(fallback_location: root_path)  # コメントしたらコメントしたページに遷移する
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, dream_id: params[:dream_id])
  end
end
