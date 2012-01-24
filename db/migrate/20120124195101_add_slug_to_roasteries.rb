class AddSlugToRoasteries < ActiveRecord::Migration
  def change
    add_column :roasteries, :slug, :string
    add_index :roasteries, :slug
  end
end
