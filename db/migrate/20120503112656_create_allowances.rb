class CreateAllowances < ActiveRecord::Migration
  def change
    create_table :allowances do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end


