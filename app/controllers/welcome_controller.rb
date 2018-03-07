class WelcomeController < ApplicationController
  def index
    @rooms = Room.all
  end

  def show
  end
end
