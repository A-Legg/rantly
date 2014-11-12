class CommentsController < ApplicationController

  def rant_comment
      @_rant = Rant.find(params[:rant_id])
      @comment = @_rant.comments.create(comment_params.merge(:user_id => current_user.id))
      @comment.save
      redirect_to :back
  end

  def user_comment
    @user = User.find(params[:user_id])
    @comment = @user.comments.create(comment_params.merge(:user_id => current_user.id))
    @comment.save
    redirect_to :back
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
