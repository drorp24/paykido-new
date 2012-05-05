class Order < ActiveRecord::Base
  
  belongs_to :user	
  has_many :transactions, :dependent => :destroy

  default_scope :order => 'orders.created_at DESC'

  attr_accessible :user_id,
  				  :merchant_id,
  				  :amount, 
  				  :title, 
  				  :description

  validates :user_id, :presence => true
  
end
# == Schema Information
#
# Table name: orders
#
#  id                     :integer         not null, primary key
#  user_id                :integer
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

