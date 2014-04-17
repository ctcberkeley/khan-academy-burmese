require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #devise :database_authenticatable, :registerable,
  #       :recoverable, :rememberable, :trackable, :validatable,
  devise :omniauthable, :omniauth_providers => [:google_oauth2, :facebook]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :provider, :uid
  #attr_accessible :name, :email, :password, :password_confirmation
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 }


  def password
    @password ||= Password.new(password_digest)
  end
  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end

  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    find_for_provider(access_token, signed_in_resource)
  end

  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    find_for_provider(access_token, signed_in_resource)
  end

  def toggle_admin
    self.toggle!(:admin)
  end

  private

    def self.find_for_provider(access_token, signed_in_resource=nil)
      data = access_token.info
      user = User.where(:email => data["email"]).first

      unless user
        user = User.create(
            name: data["name"],
            email: data["email"],
            password: Devise.friendly_token[0,20]
            )
      end
      user
    end


end
