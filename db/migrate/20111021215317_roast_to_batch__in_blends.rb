class RoastToBatch_inBlends < ActiveRecord::Migration
  def change
    remove_column :blends, :roast_id 
    add_column :blends, :batch_id, :integer
  end
end
