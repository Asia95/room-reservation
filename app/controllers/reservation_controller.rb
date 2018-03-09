class ReservationController < ApplicationController
  require 'date'
  def show
    @reservations = Reservation.all
  end

  def create
    @rooms = Room.all

    @reservation = Reservation.new
    @reservation.user = current_user
    puts "================= #{params[:reservation][:start_date]}"
    @reservation.room = @rooms.find(params[:reservation][:choosen_room])
    @reservation.start_date = Date.parse(params[:reservation][:start_date])
    @reservation.end_date = Time.parse(params[:reservation][:end_date])
    puts "============== #{@reservation.end_date}"
    respond_to do |format|
      if @reservation.save
        format.html { redirect_to root_url, notice: 'Room was successfully reserved.' }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end 
  end

  def destroy
  end
end
