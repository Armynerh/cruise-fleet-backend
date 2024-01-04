class RegistrationsController < ApplicationController
  def create
    user_params = params.require(:user).permit(:email, :password, :password_confirmation)
    user = User.new(user_params)

    if user.save
      session[:user_id] = user.id
      render json: { status: 'created', user: user }, status: :created
    else
      render json: { status: 'error', errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
