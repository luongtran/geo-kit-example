class AddSomeIndor < ActiveRecord::Migration
  def up
    add_column :locations, :address, :string
    add_column :locations, :zip_code, :string
    add_column :locations, :lat, :string
    add_column :locations, :lng, :string
  end

  def down
  end
end
