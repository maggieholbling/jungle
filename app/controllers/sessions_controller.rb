class SessionsController < ApplicationController

  def new
  end

  def create
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      # Save the user id inside the browser cookie.
      session[:user_id] = user.id
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
