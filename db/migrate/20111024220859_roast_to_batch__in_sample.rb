class RoastToBatch_inSample < ActiveRecord::Migration
  def change
     remove_column :samples, :roast_id 
     add_column :samples, :batch_id, :integer
   end
end
