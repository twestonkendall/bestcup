class CreateProducerAdmins < ActiveRecord::Migration
  def change
    create_table :producer_admins do |t|
      t.references :user
      t.references :farm

      t.timestamps
    end
    add_index :producer_admins, :user_id
    add_index :producer_admins, :farm_id
  end
end
