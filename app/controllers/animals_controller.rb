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
    @doses = @animal.doses
  end

  def edit
    @animal = Animal.find(params[:id])
  end

  def update
    @animal = Animal.find(params[:id])
    @animal.update(animal_params)
    redirect_to @animal
  end

# TODO: fix so does not delete if have doses?
  def destroy
    @animal = Animal.find(params[:id])
    @animal.destroy
    redirect_to '/'
  end

  private
  def animal_params
    params.require(:animal).permit(:name, :weight, :species)
  end
end
