class RemoveTotalFromSample < ActiveRecord::Migration
  def up
    remove_column :samples, :total
  end

  def down
    add_column :samples, :total, :integer
  end
end
