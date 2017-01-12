json.extract! activity, :id, :activity_name, :description, :start_date, :end_date, :location, :vehicle, :mobile, :telephone, :created_at, :updated_at
json.url activity_url(activity, format: :json)