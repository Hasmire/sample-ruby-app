class DashboardController < ApplicationController
  before_action :require_login
  
  def index
    @users = User.all
  end
end
