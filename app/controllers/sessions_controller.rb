class SessionsController < ApplicationController



  def new
  end

  def create
    user = User.authenticate params[:email], params[:password]
    if user
      session[:user_id] = user.id
      redirect_to tasks_path, notice: 'Добро пожаловать в Контекст!'
    else
      flash.now.alert = 'Неверный email или пароль'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Выход из Контекста успешно выполнен!'
  end


  # private

  # def show_tasks_for_user
  #   redirect_to tasks_path, notice: 'Добро пожаловать в Контекст!' if current_user
  # end

end
