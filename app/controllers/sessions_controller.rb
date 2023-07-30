class SessionsController < ApplicationController

  def new
    if current_user != nil
      redirect_to user_path(current_user)
    end
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    respond_to do |format|
      if user && user.authenticate(params[:session][:password])
        log_in user
        format.html { redirect_to user_url(user), notice: "User was successfully logged in" }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    log_out
    redirect_to login_url
  end

end
