class AddSlugToFarms < ActiveRecord::Migration
  def change
    add_column :farms, :slug, :string
    add_index :farms, :slug
    
  end
end
