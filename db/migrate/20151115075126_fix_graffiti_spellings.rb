class FixGraffitiSpellings < ActiveRecord::Migration
  def change
    change_table :graffitis do |t|
      t.rename :grafitti_dayinmonth, :graffiti_dayinmonth
      t.rename :grafitti_year, :graffiti_year
    end
  end
end
