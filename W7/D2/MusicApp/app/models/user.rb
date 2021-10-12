# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true #uniqueness handled by hasing algo
  validates :password, length: {minimum: 6}, allow_nil: true #password can be nil for users already logged in

  before_validation :ensure_session_token #don't try to validate w/o using helper methods
  #could use after_initialize here

  #methods to deal with the session token
  def self.generate_session_token
    SecureRandom::urlsafe_base64
  end

  def reset_session_token!
    self.session_token = User.generate_session_token #call class method to gen rand string
    self.save! #save with ! to throw error messages if applicable
    self.session_token #return session token if all goes well
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  #password-related methods
  def password=(password)
    self.password_digest = BCrypt::Password::create(password) #turns password arg into bcrypt string
    @password = password #instance variable, but not into db
  end

  def is_valid_password?(password)
    password_object = BCrypt::Password::new(self.password_digest) #turns digest into password object
    password_object.is_password?(password) #is the digest-object equivalent to the password arg?
    #can't do == on two BCrypt::Password::create's because they're objects with unique id's
  end

end
