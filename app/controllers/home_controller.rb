class HomeController < ApplicationController
  def index
    authenticate_user!
  end

  def new
  end
end
