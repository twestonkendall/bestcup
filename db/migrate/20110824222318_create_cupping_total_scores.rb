class CreateCuppingTotalScores < ActiveRecord::Migration
  def change
    create_table :cupping_total_scores do |t|
      t.references :sample
      t.integer :score

      t.timestamps
    end
    add_index :cupping_total_scores, :sample_id
  end
end
