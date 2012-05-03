class AddFieldsToMerchants < ActiveRecord::Migration
  def change
  	 add_column :merchants, :name,             :string
	 add_column :merchants, :email,            :string
	 add_column :merchants, :collected,        :decimal
	 add_column :merchants, :billed,           :decimal
	 add_column :merchants, :logo,             :string
	 add_column :merchants, :merchant_id,      :string
	 add_column :merchants, :merchant_site_id, :string
  end
end


 

 