class AddAccountToUsers < ActiveRecord::Migration
  def change
   add_column :users, :account_id, :integer
   add_column :users, :phone, :string
   add_column :users, :facebook, :string
   add_column :users, :skype, :string
  end
end