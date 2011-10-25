class ChangeBatchDate < ActiveRecord::Migration
  def change
    change_column :batches, :roasted_on, :date
  end
end
