class CreateBlends < ActiveRecord::Migration
  def change
    create_table :blends do |t|
      t.references :bean
      t.references :roast

      t.timestamps
    end
    add_index :blends, :bean_id
    add_index :blends, :roast_id
  end
end
