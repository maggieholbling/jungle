class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      # Save the user id inside the browser cookie.
      session[:user_id] = @user.id
      redirect_to '/'
    else
      flash.now[:error] = "Error logging in, please check your details"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end
