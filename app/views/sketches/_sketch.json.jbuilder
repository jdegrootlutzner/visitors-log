json.extract! sketch, :id, :artist, :upvotes, :created_at, :updated_at
json.url sketch_url(sketch, format: :json)
json.image url_for(sketch.image)