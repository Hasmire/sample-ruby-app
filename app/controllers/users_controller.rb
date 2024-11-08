class UsersController < ApplicationController
  layout "auth", only: [ :new ]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    logger.debug "User params: #{user_params.inspect}"

    if @user.save
      logger.debug "User saved successfully: #{@user.inspect}"
      redirect_to login_path
    else
      logger.debug "User save failed: #{@user.errors.full_messages.inspect}"
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
