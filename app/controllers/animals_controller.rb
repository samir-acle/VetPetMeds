class AnimalsController < ApplicationController
  before_action :set_animal, only: [:show, :edit, :update, :destroy, :sort]
  def index
    @animals = Animal.all.order(:name)
  end

  def new
    @animal = Animal.new
  end

  def create
    @animal = Animal.create(animal_params)
    redirect_to @animal
  end

  def show
    @doses = @animal.doses
    @doses = @doses.order(session[:sort_by])
  end

  def edit
  end

  def update
    @animal.update(animal_params)
    redirect_to @animal
  end

  # TODO: figure out how to switch from asc to desc
  def sort
    session[:sort_by] = params[:sort_by]
    redirect_to @animal
  end

# TODO: fix so does not delete if have doses?
  def destroy
    if @animal.doses
      flash[:alert] = 'You cannot delete animals that have doses'
      redirect_to @animal
    else
      @animal.destroy
      redirect_to '/'
    end
  end

  private
  def animal_params
    params.require(:animal).permit(:name, :weight, :species)
  end

  def set_animal
    @animal = Animal.find(params[:id])
  end
end
