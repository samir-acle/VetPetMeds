class DrugsController < ApplicationController
  before_action :authenticate_user!

  def index
    @drugs = Drug.all
  end
end
