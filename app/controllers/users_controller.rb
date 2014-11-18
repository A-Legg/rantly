class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    confirmation_token = @user.confirmation_token
    if @user.save
      Keen.publish(:users, :username => @user.username)
      UserMailer.welcome_email(@user).deliver
      UserMailer.confirmation_email(@user, confirmation_url(confirmation_token)).deliver
      flash[:notice] = 'You have registered successfully!'

      flash[:notice] = "Please verify email to login"
      redirect_to root_path
    else
      render '/users/new'
    end
  end

  def show
    @user = User.find(params[:id])
    @rant = Rant.new
    @rants = Rant.where(user_id: @user.id).sort_by { |rant| -Favorite.where(rant_id: rant.id).count }
    @comment = Comment.new
    @comments = Comment.where(:commentable_id => @user.id)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to dashboard_path(@user)
  end

  def activate
    @user = User.find_by_confirmation_token(params[:confirmation_token])
    @user.update_attribute('confirmed', true)

    flash[:notice] = "Account has been Verified."
    redirect_to signin_path

  end



private

def user_params
  params.require(:user).permit(:username, :password, :first_name, :last_name, :bio, :frequency, :avatar, :email)
end

end