class ReservationsController < ApplicationController
  before_action :authenticate_user!, :only => [:show , :index]
  before_action :set_reservation, only: %i[ show edit update destroy ]
  before_action :get_room



  # GET /reservations or /reservations.json
  def index
    @reservations = Reservation.all
  end

  # GET /reservations/1 or /reservations/1.json
  def show
    @reservations = @room.reservations
  end

  # GET /reservations/new
  def new
    @reservation = @room.reservations.build

  end

  # GET /reservations/1/edit
  def edit
  end

  # POST /reservations or /reservations.json
  def create
    @reservation = @room.reservations.build(reservation_params)

    respond_to do |format|
      if @reservation.save
        ReservationConfirmationMailer.with(reservation: @reservation).reservation_confirmation_email.deliver_now

        format.html { redirect_to root_path, notice: "Reservation was successfully created." }
        format.json { render :show, status: :created, location: @reservation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reservations/1 or /reservations/1.json
  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to room_reservations_path(@room), notice: "Reservation was successfully updated." }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1 or /reservations/1.json
  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to room_reservations_path(@room), notice: "Reservation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  
     def get_room
      @room = Room.find(params[:room_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = @room.reservations.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reservation_params
      params.require(:reservation).permit(:name, :last_name, :email, :persons, :start_date, :end_date, :message, :room_id)
    end
    
end
