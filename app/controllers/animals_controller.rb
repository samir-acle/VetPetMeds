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
    begin
      @animal = Animal.new(animal_params)
      @animal.species = @animal.species.downcase
      @animal.save!
    rescue ActiveRecord::RecordInvalid
      set_flash
      # Neat!
      redirect_to new_animal_path
    else
      redirect_to @animal
    end
  end

  def show
    @doses = @animal.doses
    @doses = @doses.order("#{params[:sort_by]} #{params[:order_by]}").joins(:drug, :user)
    # Bonus points for joins!
  end

  def edit
  end

  def update
    begin
      @animal.update!(animal_params)
    rescue ActiveRecord::RecordInvalid
      set_flash
      redirect_to edit_animal_path(@animal)
    else
      redirect_to @animal
    end
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

  def set_flash
    error_message = @animal.errors.full_messages.first
    if error_message.downcase.include? "species"
      flash[:alert] = "Please enter either cat or dog for the species"
    else
      flash[:alert] = error_message
    end
  end
end
