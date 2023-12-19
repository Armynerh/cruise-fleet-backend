class Api::UsersController < ApplicationController
    
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: :show
    else
      render json: @user.errors
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password)
  end
end
