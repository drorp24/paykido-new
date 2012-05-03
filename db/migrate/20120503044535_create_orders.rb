class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :account_id
      t.integer :consumer_id
      t.integer :merchant_id

      t.timestamps
    end
  end
end
