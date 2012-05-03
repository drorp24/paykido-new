class Transaction < ActiveRecord::Base
  
  belongs_to :order

  attr_accessible :order_id

  validates :order_id  , :presence => true
  
  default_scope :order => 'transactions.created_at DESC'

end
# == Schema Information
#
# Table name: transactions
#
#  id         :integer         not null, primary key
#  order_id   :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

