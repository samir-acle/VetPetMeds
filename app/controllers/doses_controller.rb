class DosesController < ApplicationController
  def new
    @animal = Animal.find(params[:animal_id])
  end
end
