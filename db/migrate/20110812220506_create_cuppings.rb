class CreateCuppings < ActiveRecord::Migration
  def change
    create_table :cuppings do |t|

      t.timestamps
    end
  end
end
