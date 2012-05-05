require 'spec_helper'

describe Allowance do
  pending "add some examples to (or delete) #{__FILE__}"
end
# == Schema Information
#
# Table name: allowances
#
#  id                    :integer         not null, primary key
#  user_id               :integer
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

