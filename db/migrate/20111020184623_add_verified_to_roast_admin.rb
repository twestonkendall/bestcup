class AddVerifiedToRoastAdmin < ActiveRecord::Migration
  def change
    add_column :roastery_admins, :verified, :boolean
  end
end
