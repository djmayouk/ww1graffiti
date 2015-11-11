class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :link
      t.string :caption
      t.references :graffiti, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
