class HomeController < ApplicationController

  before_action :authenticate_user!

  def index

    # 143.239.9.27
    @location = Geocoder.search('143.239.9.24').first.city # => "Cork"
    @companies = Company.near(@location, 50).limit(3)
    @activities = Activity.near(@location, 50).limit(3)
    @users = User.near(@location, 50).limit(3)
    
  end

end
