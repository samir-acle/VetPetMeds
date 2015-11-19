class DrugsController < ApplicationController
  before_action :authenticate_user!

  def index
    @drugs = Drug.all
    @morph = Drug.find_by(name: 'Morphine')
  end

  def new
  end

  def create
  end

  def show
    @drug = Drug.find(params[:id])
  end
end
