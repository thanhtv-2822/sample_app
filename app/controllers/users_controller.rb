class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = t "sign_up_form.success"
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @user = User.find_by(params[:id])
  end

  def new
    @user = User.new
  end

  private

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :password_confirmation,
      :birthday,
      :gender
    )
  end
end
