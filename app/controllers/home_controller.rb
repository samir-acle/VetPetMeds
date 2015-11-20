class HomeController < ApplicationController
  def index
  end

  def new
    @animal = Animal.new
    @drugs = Drug.all
    @drug = Drug.new
  end

  def create
    session[:species] = params[:species]
    session[:weight] = params[:animal][:weight]
    session[:drug] = Drug.find(params[:drug])
    session[:dosage] = (session[:weight].to_i / 10.0) * session[:drug].dosing.to_f
    redirect_to show_path
  end

  def show
    @drug = session[:drug]
  end
end
