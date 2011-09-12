class CreateRoasts < ActiveRecord::Migration
  def change
    create_table :roasts do |t|
      t.string :name
      t.date :roasted_on
      t.text :notes
      t.references :roastery

      t.timestamps
    end
    add_index :roasts, :roastery_id
  end
end
