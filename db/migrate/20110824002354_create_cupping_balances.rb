class CreateCuppingBalances < ActiveRecord::Migration
  def change
    create_table :cupping_balances do |t|
      t.references :sample
      t.integer :score

      t.timestamps
    end
    add_index :cupping_balances, :sample_id
  end
end
