class CreateBeans < ActiveRecord::Migration
  def change
    create_table :beans do |t|
      t.string :variety
      t.string :harvest_start
      t.string :harvest_end
      t.references :farm

      t.timestamps
    end
    add_index :beans, :farm_id
  end
end
