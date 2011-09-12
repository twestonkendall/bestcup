class CreateCuppingOveralls < ActiveRecord::Migration
  def change
    create_table :cupping_overalls do |t|
      t.references :sample
      t.integer :score

      t.timestamps
    end
    add_index :cupping_overalls, :sample_id
  end
end
