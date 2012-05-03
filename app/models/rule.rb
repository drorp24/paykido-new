class Rule < ActiveRecord::Base
	
	belongs_to :account
	belongs_to :consumer

  	attr_accessible :account_id,
  					:consumer_id,
  					:action,
  					:property,
  					:value
end
# == Schema Information
#
# Table name: rules
#
#  id          :integer         not null, primary key
#  account_id  :integer
#  consumer_id :integer
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#  action      :string(255)
#  property    :string(255)
#  value       :string(255)
#

