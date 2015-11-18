class DosesController < ApplicationController
  before_action :set_animal, only: [:new, :create]
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

      if @restriction && @restrication != @animal.species
        flash[:alert] = "That drug only used for #{@restriction}"
        redirect_to new_animal_dose_path(@animal)
      else
        @dosage = ( @animal.weight / 10.0 ) * @drug.dosing
        @animal.doses.create(drug: @drug, dosage: @dosage)
      end

    else
      flash[:alert] = 'Please pick a drug'
      redirect_to new_animal_dose_path(@animal)
    end

    # maybe change to new and then ask to save
    # alternative, stick with create, but delete if don't
    # want to log
  end

  private
  def set_animal
    @animal = Animal.find(params[:animal_id])
  end
end
