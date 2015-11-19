class DosesController < ApplicationController
  before_action :set_animal, only: [:new, :create]
  before_action :authenticate_user!
  before_action :set_dose, only: [:destroy, :show]
  before_action :get_animal, only: [:destroy, :show]

  def new
    @dose = @animal.doses.new
  end

  def create
    begin
      @dose = @animal.doses.new(drug_id: params[:dose]["drug_id"], user: current_user)
      @dose.save!
    rescue ActiveRecord::RecordInvalid
      flash[:alert] = @dose.errors.full_messages.first
      redirect_to new_animal_dose_path(@animal)
    else
      redirect_to @dose
    end
  end

  def index
    # @doses = Dose.all.order(session[:doses_sort_by])
    @doses = Dose.all.order("#{params[:sort_by]} #{session[:sort_order]}")
  end

  def sort
    @sort_by = params[:sort_by]
    if session[:sort_order] == "asc"
      session[:sort_order] = "desc"
    else
      session[:sort_order] = "asc"
    end
    redirect_to doses_path(:sort_by => @sort_by)
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
