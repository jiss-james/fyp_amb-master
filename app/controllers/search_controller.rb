class SearchController < ApplicationController

  def results
    @q = params[:q]
    @category = params[:category]
    @genre = ""
    if @category == "activity"
      @results = Activity.where("activity_name ILIKE ?", "%#{@q}%")
      @genre = "Activity"
    elsif @category == "user"
      @results = User.where("first_name ILIKE ?", "%#{@q}%")
      @genre = "User"
    elsif @category == "location"
      @users = User.near(@q, 50)
      @activities = Activity.near(@q, 50)
      @results = @users + @activities
    elsif @category == "ulocation"
      @users = User.near(@q, 50)
      @results = @users
    elsif @category == "alocation"
      @activities = Activity.near(@q, 50)
      @results = @activities
    else
      @results = Company.where("company_name ILIKE ?", "%#{@q}%")
      @genre = "Company"
    end
  end

end
