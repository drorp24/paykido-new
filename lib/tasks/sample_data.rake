namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    make_account
    make_users
  end
end

def make_account
    5.times do
      account = Account.create!()
      p "New account: #{account.id}"
    end
end

def make_users
  
  Account.all(:limit => 5).each do |account|

    admin = User.create!(:name => Faker::Name.name,
                       :email => "admin#{account.id}@paykido.org",
                       :password => "foobar",
                       :password_confirmation => "foobar",
                       :account_id=> account.id ,
                       :phone=>Faker::PhoneNumber,
                       :confirmed_at => Time.now.utc)
    account.admin_id = admin.id
    account.save
    
    p "admin:   #{admin.name} : #{admin.email}" 
    p "account: #{account.admin_id}"  

    4.times do
      name = Faker::Name
      user = User.create!(:name => name.name,
                       :email => "#{name.first_name}@paykido.org",
                       :password => "foobar",
                       :password_confirmation => "foobar",
                       :account_id => account.id ,
                       :phone => Faker::PhoneNumber,
                       :confirmed_at => Time.now.utc)
      p "#{user.name} : #{user.email}" 
    end
  end
end



