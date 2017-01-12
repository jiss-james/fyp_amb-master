json.extract! company, :id, :company_name, :description, :location, :created_at, :updated_at
json.url company_url(company, format: :json)