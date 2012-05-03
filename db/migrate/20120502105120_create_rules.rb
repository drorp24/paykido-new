class CreateRules < ActiveRecord::Migration
  def change
    create_table :rules do |t|
      t.integer :account_id
      t.integer :consumer_id

      t.timestamps
    end
  end
end
