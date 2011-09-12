class AddBatchToRoast < ActiveRecord::Migration
  def self.up
    add_column :roasts, :batch_number, :string
  end

  def self.down
    remove_column :roasts, :batch_number
  end
end
