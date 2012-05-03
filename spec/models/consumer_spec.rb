require 'spec_helper'

describe Consumer do
  pending "add some examples to (or delete) #{__FILE__}"
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

