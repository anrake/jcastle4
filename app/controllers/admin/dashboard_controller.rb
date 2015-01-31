class Admin::DashboardController < ApplicationController

	before_filter :authenticate_user!
	after_action :verify_authorized

  def index
  	authorize User
  end

end
