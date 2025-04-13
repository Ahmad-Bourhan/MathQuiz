class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      puts "✅ Logged in: #{user.email}, session[:user_id] = #{session[:user_id]}"
      redirect_to quizzes_path, notice: "Logged in successfully!"
    else
      puts "❌ Failed login attempt for email: #{params[:email]}"
      flash.now[:alert] = "Invalid email or password"
      render :new
    end
  end
  
  

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: "Logged out!"
  end
end
