class PaymentGetway < ActiveRecord::Base
  attr_accessible :account_id
end
# == Schema Information
#
# Table name: payment_getways
#
#  id         :integer         not null, primary key
#  account_id :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

