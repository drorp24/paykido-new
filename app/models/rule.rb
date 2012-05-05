class Rule < ActiveRecord::Base
	
	belongs_to :user
	
  	attr_accessible :user_id,
  					:action,
  					:property,
  					:value

  	validates :user_id, :presence => true
end


# == Schema Information
#
# Table name: rules
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  action     :string(255)
#  property   :string(255)
#  value      :string(255)
#

