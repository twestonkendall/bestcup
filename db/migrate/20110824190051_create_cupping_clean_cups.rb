class CreateCuppingCleanCups < ActiveRecord::Migration
  def change
    create_table :cupping_clean_cups do |t|
      t.references :sample
      t.integer :score

      t.timestamps
    end
    add_index :cupping_clean_cups, :sample_id
  end
end
