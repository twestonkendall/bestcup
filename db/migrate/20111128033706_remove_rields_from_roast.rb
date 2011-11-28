class RemoveRieldsFromRoast < ActiveRecord::Migration
  def up
    remove_column :roasts, :roasted_on
    remove_column :roasts, :batch_number    
  end

  def down
    add_column :roasts, :roasted_on, :date
    add_column :roasts, :batch_number, :string
  end
end
