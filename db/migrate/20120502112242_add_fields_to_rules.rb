class AddFieldsToRules < ActiveRecord::Migration
  def change
  	add_column :rules, :action, :string
    add_column :rules, :property, :string
    add_column :rules, :value, :string   
  end
end
