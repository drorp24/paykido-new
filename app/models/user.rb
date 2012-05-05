class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :omniauthable,:invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email,:phone,:facebook,:skype,:parent_id, :password, :password_confirmation, :remember_me, :confirmed_at
  
  has_one :account, :dependent => :destroy
  has_one :allowance, :dependent => :destroy
  has_many :rules, :dependent => :destroy
  has_many :orders, :dependent => :destroy
  has_many :transactions, :through => :orders, :source => "transactions"
  has_many :paymentgetways, :through => :account, :source => "PaymentGetway"
  has_many :sones, :foreign_key => "parent_id", :class_name => "User"


  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
  
    data = access_token.extra.raw_info
	  
    if user = self.find_by_email(data.email)
	    user
	  else # Create a user with a stub password. 
	    self.create!(:email => data.email, :password => Devise.friendly_token[0,20]) 
	  end
    
	end

	def self.new_with_session(params, session)
		
    super.tap do |user|
    	if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"]
      end
    end
  end

end

# == Schema Information
#
# Table name: users
#
#  id                     :integer         not null, primary key
#  email                  :string(255)     default(""), not null
#  encrypted_password     :string(255)     default("")
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer         default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime        not null
#  updated_at             :datetime        not null
#  name                   :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#  invitation_token       :string(60)
#  invitation_sent_at     :datetime
#  invitation_accepted_at :datetime
#  invitation_limit       :integer
#  invited_by_id          :integer
#  invited_by_type        :string(255)
#  parent_id              :integer
#  phone                  :string(255)
#  facebook               :string(255)
#  skype                  :string(255)
#

