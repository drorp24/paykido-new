class CreatePaymentGetways < ActiveRecord::Migration
  def change
    create_table :payment_getways do |t|
      t.integer :account_id

      t.timestamps
    end
  end
end
