class RantsController < ApplicationController

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
    @rant = Rant.new(rant_params)
    @rant.user_id = current_user.id
    if @rant.save
      flash[:notice] = "Rant Successful!"
      if @user.followers != nil
        @user.followers.each do |follower|
          UserMailer.followed_email(follower.email, @rant).deliver
        end
      end
      redirect_to dashboard_path(current_user)
    else
      flash[:error] = "Title must be less than 50 characters and Rant more than 140 characters."
      redirect_to dashboard_path(current_user)
    end
  end

  def destroy
    @rant = Rant.find(params[:id])
    @rant.destroy
    redirect_to dashboard_path(session[:user_id])
  end


  private

  def rant_params
    params.require(:rant).permit(:rant, :description)
  end
end