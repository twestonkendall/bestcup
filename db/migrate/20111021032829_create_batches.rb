class CreateBatches < ActiveRecord::Migration
  def change
    create_table :batches do |t|
      t.integer :roasted_on
      t.string :batch_number

      t.timestamps
    end
  end
end
