class AddSomeIndor < ActiveRecord::Migration
  def up
    add_column :locations, :address, :string
    add_column :locations, :zip_code, :string
    add_column :locations, :lat, :float
    add_column :locations, :lng, :float
  end

  def down
  end
end
