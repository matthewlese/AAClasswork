class ShortenedUrl < ApplicationRecord
  validates :short_url, presence: true, uniqueness: true
  validates :long_url, presence: true, uniqueness: true
  validates :user_id, presence: true, uniqueness: true

  def self.random_code
    s_url = SecureRandom::urlsafe_base64

    until !ShortenedUrl.exists?(s_url)
      s_url = SecureRandom::urlsafe_base64
    end

    s_url
  end

  def self.factory_method(user, l_url)
    ShortenedUrl.create( short_url: ShortenedUrl.random_code, long_url: l_url, user_id: user )
  end
end
