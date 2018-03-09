class WelcomeController < ApplicationController
  def index
    @rooms = Room.all
    @reservations = Reservation.all
  end

  def show
  end
end
