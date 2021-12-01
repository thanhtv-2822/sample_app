class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate params[:session][:password]
      active_user? user
    else
      flash.now[:danger] = t("log_in_form.fails")
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
