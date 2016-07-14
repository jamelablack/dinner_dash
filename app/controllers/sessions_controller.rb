class SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      sign_in(user)
      flash[:success] = "You're now signed in... order away!"
      if user.admin?
        redirect_to admin_items_path
        return
      end
      redirect_to items_path
    else
      flash[:danger] = "Incorrect email or password."
      redirect_to home_path
    end
  end

  def destroy
    sign_out_user
    flash[:success] = "You've signed out successfully. Come back soon!"
    redirect_to root_path
  end
end
