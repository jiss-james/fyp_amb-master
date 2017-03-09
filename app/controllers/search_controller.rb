class SearchController < ApplicationController

  def results
    #the search item
    @q = params[:q]
    #the category they are searching
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
      @genre = "Location"
      #only search for users who are available to work
    elsif @category == "ulocation"
      @users = User.where(available_for_work: true)
      @users = @users.near(@q, 50)
      @results = @users
      @genre = "Location"
    elsif @category == "alocation"
      @activities = Activity.near(@q, 50)
      @results = @activities
      @genre = "Location"
    elsif @category == "clocation"
      @companies = Company.near(@q, 50)
      @results = @companies
      @genre = "Location"
    else
      @results = Company.where("company_name ILIKE ?", "%#{@q}%")
      @genre = "Company"
    end
  end

end
