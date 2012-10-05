class AddPositionToItem < ActiveRecord::Migration
  def change
    add_column :items, :position, :integer
  end

  def down
  	remove_column :items, :position
  end
end
