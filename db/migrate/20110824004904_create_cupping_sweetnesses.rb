class CreateCuppingSweetnesses < ActiveRecord::Migration
  def change
    create_table :cupping_sweetnesses do |t|
      t.references :sample
      t.integer :score

      t.timestamps
    end
    add_index :cupping_sweetnesses, :sample_id
  end
end
