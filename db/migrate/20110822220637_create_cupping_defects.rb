class CreateCuppingDefects < ActiveRecord::Migration
  def change
    create_table :cupping_defects do |t|
      t.references :sample
      t.integer :number_of_cups
      t.integer :intensity
      t.integer :score

      t.timestamps
    end
    add_index :cupping_defects, :sample_id
  end
end
