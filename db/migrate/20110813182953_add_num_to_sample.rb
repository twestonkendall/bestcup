class AddNumToSample < ActiveRecord::Migration
  def self.up
    add_column :samples, :sample_number, :string
  end

  def self.down
    remove_column :samples, :sample_number
  end
end
