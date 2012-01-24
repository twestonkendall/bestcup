class AddSlugToRoasts < ActiveRecord::Migration
  def change
    add_column :roasts, :slug, :string
    add_index :roasts, :slug
  end
end
