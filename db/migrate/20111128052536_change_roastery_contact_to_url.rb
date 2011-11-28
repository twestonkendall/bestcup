class ChangeRoasteryContactToUrl < ActiveRecord::Migration
  def up
    remove_column :roasteries, :contact
    add_column :roasteries, :website, :string
  end

  def down
    remove_column :roasteries, :website
    add_column :roasteries, :contact, :string
  end
end
