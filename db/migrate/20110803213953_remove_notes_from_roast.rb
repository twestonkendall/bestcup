class RemoveNotesFromRoast < ActiveRecord::Migration
  def change
    remove_column :roasts, :notes
  end
end
