class ChangeGasflowToString < ActiveRecord::Migration
  def change
    change_column :checks, :gas_flow, :string
  end
end
