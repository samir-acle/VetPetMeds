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

  def sort
    @sort_by = params[:sort_by]
    session[:animal_sort_by] = @sort_by
    if session[:animal_sort_order] == "asc"
      session[:animal_sort_order] = "desc"
    else
      session[:animal_sort_order] = "asc"
    end
    redirect_to animal_path(@animal, :sort_by => @sort_by)
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

# TODO: change sort so can store in session still and see in query string?
# TODO: also make so different session values for animals and med log
# TODO: figure out how to sort by drug name!!!!
