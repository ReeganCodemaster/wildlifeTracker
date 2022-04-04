class CreateSightings < ActiveRecord::Migration[7.0]
  def change
    create_table :sightings do |t|
      t.references :animal, null: false, foreign_key: true
      t.datetime :date
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end
