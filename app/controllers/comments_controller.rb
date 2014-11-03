class CommentsController < ApplicationController
  def create
    @rant = Rant.find(params[:rant_id])
    @comment = @rant.comments.create(comment_params.merge(:user_id => current_user.id))
    if @comment.save
      redirect_to :back
    else
      render '/rants/show'
    end
  end
  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end