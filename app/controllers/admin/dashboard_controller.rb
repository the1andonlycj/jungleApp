class Admin::DashboardController < ApplicationController
  # Setting up administrator access:
  http_basic_authenticate_with name: ENV['USERNAME'], password: ENV['PASSWORD']

  
  def show
  end
end
