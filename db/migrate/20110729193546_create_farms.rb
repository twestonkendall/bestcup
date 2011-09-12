class CreateFarms < ActiveRecord::Migration
  def change
    create_table :farms do |t|
      t.string :name
      t.string :farmer
      t.string :country
      t.string :region
      t.string :elevation
      t.text :description

      t.timestamps
    end
  end
end
