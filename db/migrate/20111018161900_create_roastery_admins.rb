class CreateRoasteryAdmins < ActiveRecord::Migration
  def change
    create_table :roastery_admins do |t|
      t.references :user
      t.references :roastery

      t.timestamps
    end
    add_index :roastery_admins, :user_id
    add_index :roastery_admins, :roastery_id
  end
end
