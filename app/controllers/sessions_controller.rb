class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_sql("SELECT * FROM users WHERE email = '#{params[:email]}' AND password = '#{params[:password]}'").first
  
    if user
      session[:user_id] = user.id
      redirect_to root_path, notice: "Logged in successfully"
    else
      flash.now[:alert] = "Invalid email or password"
      render :new
    end
  end
  
  

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: "Logged out!"
  end
end
