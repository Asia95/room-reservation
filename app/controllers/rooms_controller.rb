class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]

  # GET /rooms
  # GET /rooms.json
  def index
    @rooms = Room.all
  end

  # GET /rooms/1
  # GET /rooms/1.json
  def show
  end

  # GET /rooms/new
  def new
    @room = Room.new
  end

  # GET /rooms/1/edit
  def edit
  end

  # POST /rooms
  # POST /rooms.json
  def create
    @room = Room.new(room_params)

    respond_to do |format|
      if @room.save
        flash.now[:success] = 'Room was successfully created.'
        format.html { redirect_to @room }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # # POST /rooms/1/reserve
  # # POST /rooms/1/reserve.json
  # def reserve
  #   @reservation = Reservation.new
  #   @reservation.user = current_user
  #   @reservation.room = @room
  #   @reservation.date = params[:date]
  #   if @reservation.save
  #     format.html { redirect_to root_path, notice: 'Room was successfully reserved.' }
  #     format.json { render :show, status: :created, location: @room }
  #   else
  #     format.html { render :new }
  #     format.json { render json: @room.errors, status: :unprocessable_entity }
  #   end    
  # end

  # PATCH/PUT /rooms/1
  # PATCH/PUT /rooms/1.json
  def update
    respond_to do |format|
      if @room.update(room_params)
        flash.now[:success] = 'Room was successfully updated.'
        format.html { redirect_to @room }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
    @room.destroy
    respond_to do |format|
      flash.now[:success] = 'Room was successfully destroyed.'
      format.html { redirect_to rooms_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_params
      params.require(:room).permit(:name, :capacity)
    end
end
