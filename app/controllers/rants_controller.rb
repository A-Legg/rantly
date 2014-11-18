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
    @user = current_user
    @rant = Rant.new
    @rant.description = params[:description]
    @rant.rant = params[:rant]
    @rant.user_id = current_user.id
    if @rant.save
      Keen.publish(:rants, :username => @rant.user.username)

        @user.followers.each do |follower|
          UserMailer.followed_email(follower, @rant).deliver
        end
        render json: @rant
      else
        errors = @rant.errors.messages
        render json: {errors: errors}
      end
    end



  def destroy
    @rant = Rant.find(params[:id])
    @rant.destroy
    redirect_to :back
  end

  def spam
    Rant.find(params[:rant_id]).toggle!(:spam)
    flash[:notice] = "Rant has been marked as spam!"
    redirect_to :back
  end

  def destroy_spam
    Rant.find(params[:rant_id]).destroy
    @favorites = Favorite.where(rant_id: params[:rant_id])
    @favorites.destroy_all
    redirect_to :back
  end







end