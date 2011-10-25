class AddUserToCupping < ActiveRecord::Migration
  def change
    add_column :cuppings, :user_id, :integer
  end
end
