class AddRoastIdToBatch < ActiveRecord::Migration
  def change
    add_column :batches, :roast_id, :integer
  end
end
