class Account < ActiveRecord::Base

  has_many :users, :dependent => :destroy
  has_many :consumers, :dependent => :destroy
  has_many :rules, :dependent => :destroy

  attr_accessible :admin_id,
  				:email_alert,
				:email_alert_frequency,  
				:phone_alert,            
				:phone_alert_frequency, 
				:phone_events,          
				:email_events,           
				:active,                 
				:registered            

end
# == Schema Information
#
# Table name: accounts
#
#  id                    :integer         not null, primary key
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
#  registered            :boolean
#

