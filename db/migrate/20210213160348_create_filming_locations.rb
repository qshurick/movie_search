class CreateFilmingLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :filming_locations do |t|
      t.references :location, null: false, foreign_key: true
      t.references :actor_career, null: false, foreign_key: true

      t.timestamps
    end
  end
end
