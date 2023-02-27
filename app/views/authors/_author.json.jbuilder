json.extract! author, :id, :name, :bio, :birth_date, :death_date, :place_of_birth, :place_of_death, :created_at, :updated_at
json.url author_url(author, format: :json)
