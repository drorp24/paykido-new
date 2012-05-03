namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    make_merchants
    make_users
  end
end

def make_merchants
  10.times do |n|
    name = Faker::Name
    merchant = Merchant.create!(:name => name.name,
                     :email => "#{name.first_name}@#{name.name}.org",
                     :merchant_id => rand(5000).to_s,
                     :merchant_site_id => rand(5000000).to_s)
    p "Merchant Created - #{merchant.name} : #{merchant.email}"  
  end
end

def make_payment_getway(account)
    PaymentGetway.create!(:account_id => account.id) 
    p "PaymentGetway Created for account - #{account.admin.name} : #{account.admin.email}" 
end

def make_account(admin)
     account = Account.create!(:user_id => admin.id) 
     p "Account Created for Admin - #{admin.name} : #{admin.email}"
     make_payment_getway(account)
end

def make_allowance(user)
    Allowance.create!(:user_id => user.id,
                      :allowance_period => 'month',
                      :allowance_change_date => 1.week.ago,
                      :balance_on_acd => 0.0,       
                      :purchases_since_acd => 0.0,
                      :auto_authorize_under => 100.0,
                      :auto_deny_over => 1000.0,        
                      :allowance_every => 2)
    p "Allowance Created for user - #{user.name} : #{user.email}" 
end

def make_transaction(order)
    Transaction.create!(:order_id => order.id)
    p "Transaction Created for order - #{order.title}"  
end

def make_order(user)
    order = Order.create!(:user_id => user.id,
                 :merchant_id => rand(10),
                 :amount => rand(500),
                 :title => Faker::Lorem.sentence(3),
                 :description => Faker::Lorem.sentence(5))

    p "Order Created for user - #{user.name} : #{user.email}"  
    make_transaction(order)
end


def make_rules(user)
    Rule.create!(:user_id => user.id,
                 :action => Faker::Lorem.words(3),
                 :property => Faker::Lorem.words(4),
                 :value => Faker::Lorem.sentence(5))

    p "Rule Created for user - #{user.name} : #{user.email}"  
end

def make_users_as_sones(admin)
   4.times do
      name = Faker::Name
      user = User.create!(:name => name.name,
                       :email => "#{name.first_name}@paykido.org",
                       :password => "foobar",
                       :password_confirmation => "foobar",
                       :parent_id => admin.id ,
                       :phone => Faker::PhoneNumber,
                       :confirmed_at => Time.now.utc)
      p "User Created - #{user.name} : #{user.email}" 
      make_allowance(user)
      make_rules(user)
      make_order(user)
    end
end

def make_users
  
    5.times do |n|
      
      admin = User.create!(:name => Faker::Name.name,
                         :email => "admin#{n+1}@paykido.org",
                         :password => "foobar",
                         :password_confirmation => "foobar",
                         :phone=>Faker::PhoneNumber,
                         :confirmed_at => Time.now.utc)
      p "Admin User Created - #{admin.name} : #{admin.email}"
      
      make_account(admin)
      make_users_as_sones(admin)
      make_rules(admin)  
    end
end



