class SessionsController < ApplicationController
  def new
  end

  def create
    email = params[:email]
    password = params[:password]
  
    # Vulnerable version: password is ignored in SQL logic
    query = "SELECT * FROM users WHERE email = '#{email}' OR '1'='1'"
    user = User.find_by_sql(query).first
  
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
