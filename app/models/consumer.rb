class Consumer < ActiveRecord::Base
	belongs_to :account
	belongs_to :user
	has_many :rules, :dependent => :destroy
	
  	 
  	attr_accessible :allowance_period,
  					:allowance_change_date,
					:balance_on_acd,       
					:purchases_since_acd,
					:auto_authorize_under,
					:auto_deny_over,        
					:allowance_every,
					:account_id,
					:user_id 
	validates :account_id, :presence => true				
end
# == Schema Information
#
# Table name: consumers
#
#  id                    :integer         not null, primary key
#  account_id            :integer         not null
#  user_id               :integer         not null
#  created_at            :datetime        not null
#  updated_at            :datetime        not null
#  allowance_period      :string(255)
#  allowance_change_date :datetime
#  balance_on_acd        :decimal(, )
#  purchases_since_acd   :decimal(, )
#  auto_authorize_under  :decimal(, )
#  auto_deny_over        :decimal(, )
#  allowance_every       :integer
#

