class AddDeleteToGraffitis < ActiveRecord::Migration
  def change
    add_column :graffitis, :deleted, :boolean, default: false
  end
end
