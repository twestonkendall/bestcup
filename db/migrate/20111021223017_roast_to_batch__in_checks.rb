class RoastToBatch_inChecks < ActiveRecord::Migration
  def change
    remove_column :checks, :roast_id 
    add_column :checks, :batch_id, :integer
  end
end
