class CreateGraffitis < ActiveRecord::Migration
  def change
    create_table :graffitis do |t|
      t.string :surname
      t.string :forenames
      t.string :rank
      t.string :soldier_number
      t.string :location
      t.integer :grafitti_year
      t.integer :graffiti_month
      t.integer :grafitti_dayinmonth
      t.date :dob
      t.string :survived_war
      t.text :notes

      t.timestamps null: false
    end
  end
end
