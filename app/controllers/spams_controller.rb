class SpamsController < ApplicationController

  def new
    @spam = Spam.new
  end

  def create
    @spam = Spam.new
    @spam.user_id = current_user.id
    @spam.rant_id = params[:rant_id]
    @spam.save
    redirect_to :back
  end

  def destroy
    @spam = Spam.where(rant_id: params[:rant_id], user_id: current_user.id).first
    @spam.destroy
    redirect_to :back
  end
end