class CreateCuppingAcidities < ActiveRecord::Migration
  def change
    create_table :cupping_acidities do |t|
      t.references :sample
      t.integer :score
      t.integer :intensity

      t.timestamps
    end
    add_index :cupping_acidities, :sample_id
  end
end
