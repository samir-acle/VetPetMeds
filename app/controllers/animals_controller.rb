class AnimalsController < ApplicationController
  before_action :set_animal, only: [:show, :edit, :update, :destroy, :sort]
  before_action :authenticate_user!

  def index
    @animals = Animal.all.order(:name)
    @cats = Animal.where(species: 'cat').order(:name)
    @dogs = Animal.where(species: 'dog').order(:name)
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
    @doses = @doses.order("#{params[:sort_by]} #{params[:order_by]}").joins(:drug, :user)
  end

  def edit
  end

  def update
    @animal.update(animal_params)
    redirect_to @animal
  end

  def destroy
      @animal.destroy
      redirect_to animals_path
  end

  private
  def animal_params
    params.require(:animal).permit(:name, :weight, :species)
  end

  def set_animal
    @animal = Animal.find(params[:id])
  end
end
