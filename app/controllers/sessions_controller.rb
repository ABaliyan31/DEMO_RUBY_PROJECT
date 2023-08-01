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
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        format.html { redirect_to user_url(user), notice: "User was successfully logged in" }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { redirect_to login_url, notice: "wrong combination of email/password" }
      end
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to login_url
  end

end
