class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    @user = User.new user_params
    if @user.save
      redirect_to root_path, notice: "User Created!"
    else
      flash.now[:alert] = "User was not created"
      render :new
    end
  end
end
