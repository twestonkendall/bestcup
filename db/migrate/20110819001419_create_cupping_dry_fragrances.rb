class CreateCuppingDryFragrances < ActiveRecord::Migration
  def change
    create_table :cupping_dry_fragrances do |t|
      t.references :sample
      t.integer :score
      t.integer :intensity
      t.text :notes

      t.timestamps
    end
    add_index :cupping_dry_fragrances, :sample_id
  end
end
