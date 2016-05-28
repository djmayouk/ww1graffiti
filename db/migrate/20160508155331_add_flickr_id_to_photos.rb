class AddFlickrIdToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :flickr_id, :integer, :limit => 8
  end
end
