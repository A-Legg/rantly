class SearchesController < ApplicationController

  def index
    @rant = Rant.new
    @users = User.where('last_name LIKE ? OR first_name LIKE ?', '%' + (params[:search].to_s) +'%', '%' + (params[:search].to_s) +'%')
  end


end