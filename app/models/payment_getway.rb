class PaymentGetway < ActiveRecord::Base

  belongs_to :account			
  
  attr_accessible :account_id
  validates :account_id, :presence => true

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

