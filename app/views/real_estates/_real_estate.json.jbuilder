json.extract! real_estate, :id, :title, :price, :area, :type, :poster_url, :created_at, :updated_at
json.url real_estate_url(real_estate, format: :json)
