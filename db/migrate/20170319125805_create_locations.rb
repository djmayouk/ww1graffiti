class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.text :notes
      t.references :graffiti, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
