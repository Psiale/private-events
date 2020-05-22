class SessionsController < ApplicationController
  def welcome
    @user = User.find(session[:user_id])
  end

  def create
    user = User.find_by_name(params[:name])
    if user
      session[:user_id] = user.id
      redirect_to sessions_welcome_path, notice: 'Success: You are now LOGGED IN!'
    else
      flash.now[:error] = "Who the HECK is #{params[:name]}??? That user name does not EXIST!!"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_user_path, notice: 'Logged out!'
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
