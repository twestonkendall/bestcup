class CreateCuppingBreakAromas < ActiveRecord::Migration
  def change
    create_table :cupping_break_aromas do |t|
      t.references :sample
      t.integer :score
      t.integer :intensity
      t.text :notes

      t.timestamps
    end
    add_index :cupping_break_aromas, :sample_id
  end
end
