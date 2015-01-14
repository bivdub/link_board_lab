 class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.authenticate(params[:user][:name], params[:user][:password])

    if @user
      session[:user_id] = @user.id
      flash[:success] = "Logged in!"
      redirect_to posts_path
    else
      flash[:error] = "User logon invalid"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Log out successful"
    redirect_to login_path
  end

end
