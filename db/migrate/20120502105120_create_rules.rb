class CreateRules < ActiveRecord::Migration
  def change
    create_table :rules do |t|
      t.integer :user_id
   
      t.timestamps
    end
  end
end
