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

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def edit_credentials
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_profile_information_params)
      redirect_to profile_path, notice: "Profile updated successfully."
    else
      Rails.logger.debug(@user.errors.full_messages) 
      flash.now[:alert] = @user.errors.full_messages.join(", ")
      render :edit, alert: "Failed to update profile."
    end
  end

  def update_credentials
    @user = current_user
    if @user.authenticate(user_profile_credentials_params[:password])
      if @user.update(user_profile_credentials_params)
        redirect_to profile_path, notice: "Credentials updated successfully."
      else
        Rails.logger.debug(@user.errors.full_messages) 
        flash.now[:alert] = @user.errors.full_messages.join(", ")
        render :edit, alert: "Failed to update credentials."
      end
    else
      flash.now[:alert] = "Current password is incorrect."
      render :edit
    end
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  def user_profile_information_params
    params.require(:user).permit(:username, :bio, :avatar)
  end

  def user_profile_credentials_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
