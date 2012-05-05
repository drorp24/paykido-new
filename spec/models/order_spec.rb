require 'spec_helper'

describe Order do
  pending "add some examples to (or delete) #{__FILE__}"
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

