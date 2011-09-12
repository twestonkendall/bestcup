class CreateCuppingUniformities < ActiveRecord::Migration
  def change
    create_table :cupping_uniformities do |t|
      t.references :sample
      t.integer :score

      t.timestamps
    end
    add_index :cupping_uniformities, :sample_id
  end
end
