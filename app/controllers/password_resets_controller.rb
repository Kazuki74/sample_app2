class PasswordResetsController < ApplicationController
  def new
  end
  
  def create
    @user = User.find_by(email :params[:password_reset][:email].downcase)
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:info] = "Email sent with password reset instructions."
      redirecit_to root_url
    else
      flash.now[:danger] = "Email address was not found"
      render 'new'
    end
  end

  def edit
  end
end
