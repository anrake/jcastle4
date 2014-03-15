class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, 
         :omniauth_providers => [:facebook]

  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

	def self.find_for_facebook_oauth(auth)
    user = User.where(:email => auth.info.email).first()

    if user
      user = User.where(:email => auth.info.email).first()
      user.uid = auth.uid
      user.provider = auth.provider
      user
    else
  	where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
    	user.provider = auth.provider
    	user.uid = auth.uid
    	user.email = auth.info.email
    	user.password = Devise.friendly_token[0,20]
    	user.name = auth.info.name   # assuming the user model has a name
  #  	user.image = auth.info.image # assuming the user model has an image
      user.skip_confirmation!
    	user.save!
  	end
    end
	end

end