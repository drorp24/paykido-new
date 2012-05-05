class Merchant < ActiveRecord::Base
  attr_accessible :name, :email, :merchant_id, :merchant_site_id
end

# == Schema Information
#
# Table name: merchants
#
#  id               :integer         not null, primary key
#  created_at       :datetime        not null
#  updated_at       :datetime        not null
#  name             :string(255)
#  email            :string(255)
#  collected        :decimal(, )
#  billed           :decimal(, )
#  logo             :string(255)
#  merchant_id      :string(255)
#  merchant_site_id :string(255)
#

