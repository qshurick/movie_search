class CreateActorCareers < ActiveRecord::Migration[6.1]
  def change
    create_table :actor_careers do |t|
      t.references :actor, null: false, foreign_key: true
      t.references :movie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
