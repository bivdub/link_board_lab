class UsersController < ApplicationController

  def new
    @user_page = User.new
  end

  def create
     @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render :action => 'new'
    end
  end

  def show
    @user = current_user
    @current_user = current_user
    @user_page = User.find(params[:id])
    @posts = @user_page.posts.all
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end