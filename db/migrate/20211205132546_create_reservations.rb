class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.string :name
      t.string :last_name
      t.string :email
      t.string :persons
      t.datetime :start_time
      t.datetime :end_time
      t.string :message

      t.timestamps
    end
  end
end
