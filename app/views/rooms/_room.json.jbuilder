json.extract! room, :id, :name, :description, :thumbnail_image, :images, :person, :created_at, :updated_at
json.url room_url(room, format: :json)
