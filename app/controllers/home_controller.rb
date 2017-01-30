class HomeController < ApplicationController

  before_action :authenticate_user!

  def index

    @location = Geocoder.search('95.44.76.199').first.city # => "Saint Petersburg"  
    @results = Activity.near("95.44.76.199", 50)
    # @activities = Activity.near(@location, 50)
    # @results = @users + @activities

  end

end
