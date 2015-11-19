class DosesController < ApplicationController
  before_action :set_animal, only: [:new, :create]
  before_action :authenticate_user!
  before_action :set_dose, only: [:destroy, :show]
  before_action :get_animal, only: [:destroy, :show]

  def new
    @dose = @animal.doses.new
  end

  def create
    # TODO: find better validation way
    # TODO: do not allow dose if has restriction

    if params[:dose]["drug_id"] != ""
      @drug = Drug.find(params[:dose]["drug_id"])
      @restriction = @drug.restrictions
      puts '*' * 50
      puts @restriction

      if @restriction && @restriction != @animal.species
        flash[:alert] = "That drug only used for #{@restriction}"
        redirect_to new_animal_dose_path(@animal)
      else
        @dosage = ( @animal.weight / 10.0 ) * @drug.dosing
        @dose = @animal.doses.create(drug: @drug, dosage: @dosage, user: current_user)
        redirect_to @dose
      end

    else
      flash[:alert] = 'Please pick a drug'
      redirect_to new_animal_dose_path(@animal)
    end

    # maybe change to new and then ask to save
    # alternative, stick with create, but delete if don't
    # want to log
  end

  def index
    @doses = Dose.all.order(session[:doses_sort_by])
  end

  def sort
    session[:doses_sort_by] = params[:sort_by]
    redirect_to doses_path
  end

  def show
    @dose = Dose.find(params[:id])
    @animal = @dose.animal
  end

  def destroy
    @dose.destroy
    redirect_to @animal
  end

  private
  def set_animal
    @animal = Animal.find(params[:animal_id])
  end

  def set_dose
    @dose = Dose.find(params[:id])
  end

  def get_animal
    @animal = @dose.animal
  end
end
