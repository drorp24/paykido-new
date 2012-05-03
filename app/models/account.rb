class Account < ActiveRecord::Base
  
  belongs_to :user
  
  has_many :payment_getways, :dependent => :destroy
  has_one :admin, :foreign_key => "id", :class_name => "User"
  

  attr_accessible :user_id,
  				:email_alert,
				:email_alert_frequency,  
				:phone_alert,            
				:phone_alert_frequency, 
				:phone_events,          
				:email_events,           
				:active            
				        
  validates :user_id, :presence => true
  
end


# == Schema Information
#
# Table name: accounts
#
#  id                    :integer         not null, primary key
#  user_id               :integer
#  created_at            :datetime        not null
#  updated_at            :datetime        not null
#  admin_id              :integer
#  email_alert           :boolean
#  email_alert_frequency :string(255)
#  phone_alert           :boolean
#  phone_alert_frequency :string(255)
#  phone_events          :string(255)
#  email_events          :string(255)
#  active                :boolean
#

