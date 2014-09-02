class RantsController < ApplicationController

  def new
    @rant = Rant.new
  end

  def create
    @rant = Rant.new(
      rant: params[:rant][:rant],
      description: params[:rant][:description],
      user_id: current_user.id
    )
    if @rant.save
      redirect_to user_path(@user.id)
    end

  end

  def destroy
    @rant = Rant.find(params[:id])



    @rant.destroy




    redirect_to user_path(session[:user_id])
  end



end