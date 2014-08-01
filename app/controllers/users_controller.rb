class UsersController < ApplicationController


  def new
    @user = User.new
  end

  def create
    permitted = params.require(:user).permit(:email, :password, :password_confirmation)
    @user = User.new permitted

    if @user.save
      redirect_to tasks_path, notice: 'Добро пожаловать в Контекст!'
    else
      render :new
    end
  end

end
