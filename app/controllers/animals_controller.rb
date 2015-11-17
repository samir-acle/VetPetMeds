class AnimalsController < ApplicationController
  def index
    @animals = Animal.all
  end

  def new
    @animal = Animal.new
  end

  def create
    @animal = Animal.create(animal_params)
    redirect_to @animal
  end

  def show
    @animal = Animal.find(params[:id])
  end

  private
  def animal_params
    params.require(:animal).permit(:name, :weight, :species)
  end
end
