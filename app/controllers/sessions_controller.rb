class SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      sign_in(user)
      redirect_to items_path
    else
      redirect_to sign_in_path
    end
  end

  def destroy
    sign_out_user
    redirect_to home_path
  end
end
