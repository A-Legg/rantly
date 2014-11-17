class RantsController < ApplicationController
  respond_to :json

  def show
    @user = User.find_by(params[:user_id])
    @rant = Rant.new
    @_rant = Rant.find(params[:id])
    @comment = Comment.new
    @comments = Comment.where(:commentable_id => @_rant.id)
  end

  def new
    @rant = Rant.new
  end

  def create
    @rant = Rant.new
    @rant.description = params[:description]
    @rant.rant = params[:rant]
    @rant.user_id = current_user.id





    if @rant.save
      Keen.publish(:rants, :username => @rant.user.username)

#       if @user.followers != nil
#         @user.followers.each do |follower|
#           UserMailer.followed_email(follower.email, @rant).deliver
#
# end
    render json: @rant
    else

      errors = @rant.errors.messages
      render json: {errors: errors}
    end
  end


  def destroy
    @rant = Rant.find(params[:id])
    @rant.destroy
    redirect_to dashboard_path(session[:user_id])
  end


  private



end