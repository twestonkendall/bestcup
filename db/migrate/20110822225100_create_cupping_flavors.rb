class CreateCuppingFlavors < ActiveRecord::Migration
  def change
    create_table :cupping_flavors do |t|
      t.references :sample
      t.integer :score
      t.text :notes

      t.timestamps
    end
    add_index :cupping_flavors, :sample_id
  end
end
