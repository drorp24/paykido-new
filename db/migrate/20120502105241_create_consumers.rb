class CreateConsumers < ActiveRecord::Migration
  def change
    create_table :consumers do |t|
      t.integer :account_id , :null => false
      t.integer :user_id    , :null => false

      t.timestamps
    end
  end
end
