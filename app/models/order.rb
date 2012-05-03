class Order < ActiveRecord::Base
  attr_accessible :account_id, :consumer_id, :merchant_id
end
# == Schema Information
#
# Table name: orders
#
#  id                     :integer         not null, primary key
#  account_id             :integer
#  consumer_id            :integer
#  merchant_id            :integer
#  created_at             :datetime        not null
#  updated_at             :datetime        not null
#  amount                 :decimal(, )
#  title                  :string(255)
#  description            :string(255)
#  authorized             :boolean
#  authorization_date     :datetime
#  authorization_type     :string(255)
#  authorization_property :string(255)
#  authorization_value    :string(255)
#

