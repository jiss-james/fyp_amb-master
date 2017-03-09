class HomeController < ApplicationController

  # before_action :authenticate_user!

  def index

    #requests ip address and finds city
    @location = Geocoder.search(request.remote_ip).first.city # => "Cork"

    #finds companies in the city within 50km
    #query is limited to 4 companies, if there is a more a variable is set to true (for view use).
    @noofcompanies = Company.near(@location, 50).size
    if @noofcompanies > 4
      @lotsofcompanies = true
    else
      @lotsofcompanies = false
    end
    @companies = Company.near(@location, 50).limit(4)

    #finds activities in the city within 50km
    #query is limited to 4 activities, if there is a more a variable is set to true (for view use).
    @noofactivities = Activity.near(@location, 50).size
    if @noofactivities > 4
      @lotsofactivities = true
    else
      @lotsofactivities = false
    end
    @activities = Activity.near(@location, 50).limit(4)

    #find all users who are ready to work
    #query is limited to 4 users, if there is a more a variable is set to true (for view use).
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
