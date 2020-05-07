class SessionsController < ApplicationController
  def new
    # user = @User.new
  end


  def welcome
    @user = User.find(session[:user_id])
  end

  def create
    user = User.find_by_name(params[:name])
    if user
      session[:user_id] = user.id
      redirect_to "/sessions/welcome", notice: 'Success: You are now LOGGED IN!' 
      # format.json { render :show, status: :created, location: @user }
    else
      flash.now[:error] = "Who the HELL is #{params[:name]}???"
      render :new
      # format.html { render :new }
      # format.json { render json: @user.errors, status: :unprocessable_entity }
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to "/sessions/welcome", notice: "Logged out!"
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
