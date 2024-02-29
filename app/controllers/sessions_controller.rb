# frozen_string_literal: true

# overiden session controller
class SessionsController < ApplicationController
  def create
    user = User.find_by_email(sign_in_params[:email])

    if user&.valid_password?(sign_in_params[:password])
      @current_user = user
    else
      render json: { errors: { 'email or password' => ['is invalid'] } }, status: :unprocessable_entity
    end
  end

  private

  def sign_in_params
    params.require(:user).permit(:email, :password, :username)
  end
end
