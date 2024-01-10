class Api::ReservationsController < ApplicationController
  before_action :set_user, only: %i[index create destroy]

  def index
    @reservations = current_user.reservations.includes([:item])
    render json: @reservations.to_json(include: { item: { only: %i[id image name] } })
  end

  def create
    @reservation = @user.reservations.build(reservation_params)
    if @reservation.save
      render json: @reservation
    else
      puts @reservation.errors.full_messages
      render json: @reservation.errors
    end
  end

  def destroy
    @reservation = @user.reservations.find(params[:id])
    if @reservation.destroy
      render json: @reservation
    else
      render json: @reservation.errors
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def reservation_params
    params.require(:reservation).permit(:start, :finish, :item_id, :user_id)
    # params.require(:reservation).permit(:total_price, :start, :finish, :item_id, :user_id, :city)
  end
end
