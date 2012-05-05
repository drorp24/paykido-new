class AddFieldsToAccounts < ActiveRecord::Migration
  def change
  	add_column :accounts, :admin_id, :integer
  	add_column :accounts, :email_alert, :boolean
    add_column :accounts, :email_alert_frequency, :string
    add_column :accounts, :phone_alert, :boolean
    add_column :accounts, :phone_alert_frequency, :string
    add_column :accounts, :phone_events, :string
    add_column :accounts, :email_events, :string
    add_column :accounts, :active, :boolean
  end
end