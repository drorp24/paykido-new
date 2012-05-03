# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    account_id 1
    consumer_id 1
    merchant_id 1
  end
end
