class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, 
         :omniauth_providers => [:facebook, :twitter, :google_oauth2]

  has_many :identities

  TEMP_EMAIL = 'change@me.com'
  TEMP_EMAIL_REGEX = /change@me.com/
  validates_format_of :email, :without => TEMP_EMAIL_REGEX, on: :update

  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?


  def set_default_role
    self.role ||= :user
  end

  def self.find_for_oauth(auth, signed_in_resource = nil)
      #p "*** oauth info: #{auth.inspect}"
   
      # Get the identity and user if they exist
      identity = Identity.find_for_oauth(auth)
      user = identity.user
      if user.nil?
   
        # Get the existing user from email if the OAuth provider gives us an email
        user = User.where(:email => auth.info.email).first if auth.info.email
   
        # Create the user if it is a new registration
        if user.nil?
          user = User.new(
            name: auth.extra.raw_info.name,
            #username: auth.info.nickname || auth.uid,
            email: auth.info.email.blank? ? TEMP_EMAIL : auth.info.email,
            password: Devise.friendly_token[0,20]
          )
          user.skip_confirmation!
          user.save!
        end
   
        # Associate the identity with the user if not already
        if identity.user != user
          identity.user = user
          identity.save!
        end
      end
      user
    end

end