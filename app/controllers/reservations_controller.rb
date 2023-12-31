class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
    respond_to do |format|
      format.json { render json: { result: @reservations } }
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
    @total = Item.find(@reservation.item_id).cost

    respond_to do |format|
      format.html
      format.json { render json: { result: { reservation: @reservation, total: @total } } }
    end
  end

  def create
    reservation_params = params.require(:reservation).permit(:user_id, :item_id, :start, :finish, :city, :day_cost,
                                                             :total_days, :total_cost)

    @result = if (@new_reservation = Reservation.create!(reservation_params))
                'Reservation created succesfully!'
              else
                'Reservation not created!!!'
              end
    respond_to do |format|
      format.html
      format.json { render json: { result: @result, reservation: @new_reservation } }
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @result = if @reservation.destroy
                'Reservatino destroyed succesfully!'
              else
                'Reservatino not destroyed!!!'
              end
    respond_to do |format|
      format.html
      format.json { render json: { result: @result, reservation: @reservation } }
    end
  end
end
