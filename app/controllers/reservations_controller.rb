class ReservationsController < ApplicationController
  require 'date'
  require 'time'

  def index
    @rooms = Room.all
    @reservations = Reservation.where("start_date >= :date", { date: DateTime.now })
    @reservation = Reservation.new
  end

  def show
  end

  def new
    #@reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new
    @reservation.user = current_user
    @reservation.room = Room.find(params[:reservation][:choosen_room])
    @reservation.start_date = DateTime.parse(params[:reservation][:start_date])

    puts "--------------------- #{@reservation.start_date}"
    puts "===================== #{params[:reservation][:end_date]}"

    reserv_end_date = Time.parse(params[:reservation][:end_date])
    @reservation.end_date = @reservation.start_date.to_date + reserv_end_date.seconds_since_midnight.seconds
    @reservations = Reservation.where("start_date >= :date", { date: DateTime.now })

    respond_to do |format|
      if @reservation.save
        format.html { redirect_to root_url, notice: 'Room was successfully reserved.' }
        format.js { flash[:notice] = 'Room was successfully reserved.' }
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
    @reservations = Reservation.where("start_date >= :date", { date: DateTime.now })
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Reservation was deleted.' }
      format.js { flash[:notice] = 'Reservation was deleted.' }
      format.json { head :no_content }
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date)
  end

end
