class ReservationsController < ApplicationController
  require 'date'
  require 'time'

  def index
    @rooms = Room.all
    @reservations = Reservation.all
    @reservation = Reservation.new
  end

  def show
  end

  def new
    @rooms = Room.all
    @reservation = Reservation.new
    @reservations = Reservation.all
  end

  def create
    @rooms = Room.all
    @reservations = Reservation.all

    @reservation = Reservation.new
    @reservation.user = current_user
    puts "================= #{params[:reservation][:end_date]}"
    @reservation.room = @rooms.find(params[:reservation][:choosen_room])
    @reservation.start_date = DateTime.parse(params[:reservation][:start_date])

    
    puts "--------------------- #{@reservation.end_date}"
    reserv = Time.parse(params[:reservation][:end_date])
    puts "--------------------- #{reserv}"
    tmp = @reservation.start_date.to_date + reserv.seconds_since_midnight.seconds
    puts "[[[[[[[[[[[[[[[[[[[[[[[[[[[ #{tmp}"
    @reservation.end_date = @reservation.start_date.to_date + reserv.seconds_since_midnight.seconds
    puts "============== #{@reservation.end_date}"
    puts "============== #{reserv}"
    respond_to do |format|
      if @reservation.save
        format.html { redirect_to root_url, notice: 'Room was successfully reserved.' }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :index }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end 
  end

  def destroy
    @reservations = Reservation.all
    @reservations.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Reservation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

end
