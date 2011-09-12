class CreateChecks < ActiveRecord::Migration
  def change
    create_table :checks do |t|
      t.string :milestones
      t.decimal :gas_flow, :precision => 2
      t.string :air_flow
      t.decimal :temp, :precision => 3
      t.decimal :time, :precision => 2
      t.text  :notes
      t.references :roast
      
      
      t.timestamps
    end
  end
end
