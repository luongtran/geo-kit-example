class ChangeColumn < ActiveRecord::Migration
  def up
    change_column :locations, :lat, :float
    change_column :locations, :lng, :float
  end

  def down
  end
end
