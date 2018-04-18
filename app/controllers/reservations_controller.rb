class ReservationsController < ApplicationController
  require 'date'
  require 'time'

  def index
    @rooms = Room.all
    @reservations = Reservation.recent
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
    @reservations = Reservation.recent

    # chceck if okk
    if !@reservations.empty?
      room_reservations = @reservations.where("room_id = ? AND end_date > ?", @reservation.room, @reservation.start_date)
    end
    respond_to do |format|
      if room_reservations.empty?
        if @reservation.save          
          format.html { redirect_to root_url }
          format.js { flash.now[:success] = 'Room was successfully reserved.' }
          format.json { render :show, status: :created, location: @room }
        else
          flash.now[:danger] = 'Room cannot be reserved.'
          format.html { render :index }
          format.json { render json: @room.errors, status: :unprocessable_entity }
        end
      else
        format.html { render :index }
        format.js { flash.now[:danger] = 'Room is reserved at this time.' }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end 
  end

  def destroy
    @reservations = Reservation.all
    @reservations.find(params[:id]).destroy
    @reservations = Reservation.recent

    # Check if show all reservations or just user reservations
    @reservations = helpers.get_all_or_just_user_reservations
    
    respond_to do |format|
      flash.now[:success] = 'Reservation was deleted.'
      format.html { }
      format.js { }
      format.json { head :no_content }
    end
  end

  def past_reservations
    @reservations = Reservation.past    
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date)
  end

end
