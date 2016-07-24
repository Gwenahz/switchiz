class DashboardsController < ApplicationController

	before_filter :authenticate_user!, only: [:home, :smartphone]

  def home
  end

  def smartphone
  end
end
