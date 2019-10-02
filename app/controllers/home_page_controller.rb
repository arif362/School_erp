class HomePageController < ApplicationController
  def index
    if current_user
      redirect_to dashboard_home_path
    end
  end
end
