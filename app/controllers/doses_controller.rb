class DosesController < ApplicationController
  before_action :set_animal, only: [:new, :create]
  before_action :authenticate_user!
  # You have this before_action in most of your controllers, so I'd just do it once in your application controller; then use skip_before_action where necessary.
  before_action :set_dose, only: [:destroy, :show]
  before_action :get_animal, only: [:destroy, :show]

  def new
    @dose = @animal.doses.new
  end

  def create
    begin
      @dose = @animal.doses.new(drug_id: params[:dose]["drug_id"], user: current_user)
      @dose.save!
      # If you're doing a .save! right after a .new!, you may as well do it in one line with .create!
    rescue ActiveRecord::RecordInvalid
      flash[:alert] = @dose.errors.full_messages.first
      redirect_to new_animal_dose_path(@animal)
    else
      redirect_to @dose
    end
    # I know we talked about this, but was there a reason you're using begin/rescue here instead of if @dose.save... else? That follows convention a bit better.
  end

  def index
    @doses = Dose.order("#{params[:sort_by]} #{params[:order_by]}").joins(:drug, :user, :animal)
  end

  def show
    @dose = Dose.find(params[:id])
    #set_dose
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
