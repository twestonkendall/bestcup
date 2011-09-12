class AddWeightToBlend < ActiveRecord::Migration
  def change
    add_column :blends, :weight, :decimal, :precision => 3, :scale => 2
    add_column :blends, :lot_number, :string
  end
end
