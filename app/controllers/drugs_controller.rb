class DrugsController < ApplicationController
  before_action :authenticate_user!

  def index
    @drugs = Drug.all
  end

  def new
  end

  def create
  end

  def show
    @drug = Drug.find(params[:id])
  end
end
