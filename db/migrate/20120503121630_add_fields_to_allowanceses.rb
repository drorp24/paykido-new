class AddFieldsToAllowanceses < ActiveRecord::Migration
  def change
  	add_column :allowances, :allowance_period, :string
    add_column :allowances, :allowance_change_date, :datetime
    add_column :allowances, :balance_on_acd, :decimal
    add_column :allowances, :purchases_since_acd, :decimal
    add_column :allowances, :auto_authorize_under, :decimal
    add_column :allowances, :auto_deny_over, :decimal
    add_column :allowances, :allowance_every, :integer
  end
end