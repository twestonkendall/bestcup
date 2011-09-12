class CreateSamples < ActiveRecord::Migration
  def change
    create_table :samples do |t|
      t.references :cupping
      t.references :roast
      t.string :color

      t.timestamps
    end
    add_index :samples, :cupping_id
    add_index :samples, :roast_id
  end
end
