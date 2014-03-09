class SessionsController < ApplicationController

  def create
    if user = User.authenticate(params[:username], params[:password])
      session[:user_id] = user.id
      flash[:success] = 'You have successfully logged in.'
      redirect_to root_path
    else
      flash.now[:danger] = 'Login failed: incorrect username or password.'
      render :action => 'new'
    end
  end

  def destroy
    reset_session
    flash[:success] = 'You have successfully logged out.'
    redirect_to root_path
  end

end
