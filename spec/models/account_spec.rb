require 'spec_helper'

describe Account do
  pending "add some examples to (or delete) #{__FILE__}"
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

