class HomeController < ApplicationController

  before_action :authenticate_user!

  def index

    # 193.1.253.139
    # @location = Geocoder.search('143.239.9.1').first.city # => "Cork"
    @location = Geocoder.search(request.remote_ip).first.city # => "Cork"

    @noofcompanies = Company.near(@location, 50).size
    if @noofcompanies > 4
      @lotsofcompanies = true
    else
      @lotsofcompanies = false
    end
    @companies = Company.near(@location, 50).limit(4)

    @noofactivities = Activity.near(@location, 50).size
    if @noofactivities > 4
      @lotsofactivities = true
    else
      @lotsofactivities = false
    end
    @activities = Activity.near(@location, 50).limit(4)

    #find all users who are ready to work
    @users = User.where(available_for_work: true)
    @noofusers = @users.near(@location, 50).size
    if @noofusers > 4
      @lotsofusers = true
    else
      @lotsofusers = false
    end
    @users = @users.near(@location, 50).limit(4)

  end

end
