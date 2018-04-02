class ReservationsController < ApplicationController
  require 'date'
  require 'time'

  def index
    @only_user_reservations = helpers.check_if_only_user_reservations
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
          format.js { flash.now[:success] = 'Room was successfully reserved1.' }
          format.json { render :show, status: :created, location: @room }
        else
          flash.now[:danger] = 'Room cannot be reserved.'
          format.html { render :index }
          format.json { render json: @room.errors, status: :unprocessable_entity }
        end
      else
        format.html { render :index }
        format.js { flash.now[:danger] = 'Room is reserved at this time1.' }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end 
  end

  def destroy
    @reservations = Reservation.all
    @reservations.find(params[:id]).destroy

    # Check from where the request came
    @only_user_reservations = helpers.check_if_only_user_reservations
    if @only_user_reservations
      @reservations = Reservation.recent.where(user_id: current_user.id)
      puts "-------------------------------- #{request.path}"
    else
      @reservations = Reservation.recent
      puts "-------------------------------- #{request.path}"
    end
    respond_to do |format|
      flash.now[:success] = 'Reservation was deleted.'
      format.html { redirect_to root_url }
      format.js {  }
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
