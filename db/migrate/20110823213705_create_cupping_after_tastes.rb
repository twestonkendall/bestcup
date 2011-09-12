class CreateCuppingAfterTastes < ActiveRecord::Migration
  def change
    create_table :cupping_after_tastes do |t|
      t.references :sample
      t.integer :score
      t.text :notes

      t.timestamps
    end
    add_index :cupping_after_tastes, :sample_id
  end
end
