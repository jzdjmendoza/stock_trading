class AdminController < ApplicationController
  before_action :check_if_admin

  def check_if_admin
    redirect_to new_user_session_path unless current_user && current_user.admin?
  end
end
