class SearchesController < ApplicationController

  def index
    params[:search] ||= "Search Here"
    @rant = Rant.new
    @rants = Rant.where('description LIKE ? OR rant LIKE ?', '%' + (params[:search].to_s) +'%', '%' + (params[:search].to_s) +'%')
    @users = User.where('last_name LIKE ? OR first_name LIKE ? OR username lIKE ?', '%' + (params[:search].to_s) +'%', '%' + (params[:search].to_s) +'%', '%' + (params[:search].to_s) +'%')
  end




end