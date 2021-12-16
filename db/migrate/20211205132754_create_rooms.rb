class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :description
      t.string :thumbnail_image
      t.string :images
      t.string :person

      t.timestamps
    end
  end
end
