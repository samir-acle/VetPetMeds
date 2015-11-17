class DosesController < ApplicationController
  def new
    @animal = Animal.find(params[:animal_id])
    @dose = @animal.doses.new
  end

  def create
    @drug = Drug.find(params[:dose]["drug_id"])
    @animal = Animal.find(params[:animal_id])
    @dosage = ( @animal.weight / 10.0 ) * @drug.dosing
    @animal.doses.create(drug: @drug, dosage: @dosage)

    # maybe change to new and then ask to save
    # alternative, stick with create, but delete if don't
    # want to log
  end
end
