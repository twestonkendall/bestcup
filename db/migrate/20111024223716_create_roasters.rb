class CreateRoasters < ActiveRecord::Migration
  def change
    create_table :roasters do |t|
      t.references :user
      t.references :roastery

      t.timestamps
    end
    add_index :roasters, :user_id
    add_index :roasters, :roastery_id
  end
end