class AddTotalToSamples < ActiveRecord::Migration
  def change
    add_column :samples, :total, :integer
  end
end
