class CreateCuppingMouthfeels < ActiveRecord::Migration
  def change
    create_table :cupping_mouthfeels do |t|
      t.references :sample
      t.integer :score
      t.integer :weight

      t.timestamps
    end
    add_index :cupping_mouthfeels, :sample_id
  end
end
