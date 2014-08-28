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

end