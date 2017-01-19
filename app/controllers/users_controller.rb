class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @hash = Gmaps4rails.build_markers(@user) do |user, marker|
    marker.lat user.latitude
    marker.lng user.longitude
    marker.infowindow user.first_name
    end
  end

end
