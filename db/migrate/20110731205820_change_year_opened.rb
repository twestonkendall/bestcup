class ChangeYearOpened < ActiveRecord::Migration
  def change
    change_column :roasteries, :year_opened, :integer
  end
end
