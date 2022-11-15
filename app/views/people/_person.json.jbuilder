json.extract! person, :id, :name, :email, :login, :created_at, :updated_at
json.url person_url(person, format: :json)
