class Transaction < ActiveRecord::Base
  attr_accessible :account_id, :order_id
end
# == Schema Information
#
# Table name: transactions
#
#  id         :integer         not null, primary key
#  account_id :integer
#  order_id   :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

