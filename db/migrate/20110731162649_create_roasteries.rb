class CreateRoasteries < ActiveRecord::Migration
  def change
    create_table :roasteries do |t|
      t.string :name
      t.date :year_opened
      t.text :description
      t.string :contact

      t.timestamps
    end
  end
end
