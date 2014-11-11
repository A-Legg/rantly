class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.generate_confirmation_token
    if @user.save
      UserMailer.welcome_email(@user).deliver
      UserMailer.confirmation_email(@user, 'confirm+"/#{@user.confirmation_token}"').deliver
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
    flash[:success] = "Account has been Verified."
    redirect_to signin_path
  else
    flash[:notice] = "Account could not be verified"
    redirect_to :back

  end



private

def user_params
  params.require(:user).permit(:username, :password, :first_name, :last_name, :bio, :frequency, :image, :email)
end

end