class HomeController < ApplicationController

  before_action :authenticate_user!

  def index

    # 143.239.9.27
    @location = Geocoder.search('143.239.9.24').first.city # => "Cork"
    @companies = Company.near(@location, 50)
    @activities = Activity.near(@location, 50)
    @users = User.near(@location, 50)
    # @results = @activities + @companies

  end

end
