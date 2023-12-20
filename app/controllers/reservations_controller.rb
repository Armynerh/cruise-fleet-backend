class ReservationsController < ApplicationController
  def show
    @reservation = Reservation.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: { result: { reservation: @reservation} } }
    end
  end

  def create
    reservation_params = params.require(:reservation).permit(:user_id, :item_id, :start, :finish)
    if @new_reservation = Reservation.create!(reservation_params)
      @result = "Reservation created succesfully!"
    else
      @result = "Reservation not created!!!"
    end
    respond_to do |format|
      format.html
      format.json { render json: { result: @result, reservation: @new_reservation } }
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    if @reservation.destroy
      @result = "Reservatino destroyed succesfully!"
    else
      @result = "Reservatino not destroyed!!!"
    end
    respond_to do |format|
      format.html
      format.json { render json: { result: @result, reservation: @reservation } }
    end
  end
end