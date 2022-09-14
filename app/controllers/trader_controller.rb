class TraderController < ApplicationController
  before_action :check_if_trader
  before_action :default_to_dashboard

  def check_if_trader
    redirect_to new_user_session_path unless current_user && current_user.trader?
  end

  def default_to_dashboard
    redirect_to dashboard_path if current_user.status == 'pending'
  end
end
