class AddFieldsToOrders < ActiveRecord::Migration
  def change
  	add_column :orders, :amount,                 :decimal
	add_column :orders, :title,                  :string
	add_column :orders, :description,            :string
	add_column :orders, :authorized,             :boolean
	add_column :orders, :authorization_date,     :datetime
	add_column :orders, :authorization_type,     :string
	add_column :orders, :authorization_property, :string
	add_column :orders, :authorization_value,    :string
  end
end


