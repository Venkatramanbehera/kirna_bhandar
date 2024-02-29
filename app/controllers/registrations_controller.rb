# frozen_string_literal: true

# overiden session controller
class RegistrationsController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      @current_user = user
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :username)
  end
end
