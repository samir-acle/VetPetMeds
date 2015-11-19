class HomeController < ApplicationController
  def index
  end

  def new
    @animal = Animal.new
    @drugs = Drug.all
    @drug = Drug.new
  end

  def create
    @animal = Animal.new
    @animal.species = params[:species]
    @animal.weight = params[:animal][:weight]
    @drugs = Drug.all
    @drug = Drug.find(params[:drug])
    @dosage = (@animal.weight / 10) * @drug.dosing
    params.inspect
    render :new
  end
end
