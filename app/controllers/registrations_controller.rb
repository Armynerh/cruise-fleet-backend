class RegistrationsController < ApplicationController
  def create
    user_params = params.require(:user).permit(:email, :password, :password_confirmation)
    user = User.new(user_params)

    if user.save
      session[:user_id] = user.id
      render json: { status: 'created', user: user }
    else
      render json: { status: 500, errors: user.errors.full_messages }
    end
  end
end
