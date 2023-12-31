require 'openssl'

class User < ActiveRecord::Base
  ITERATTIONS = 20000
  DIGEST = OpenSSL::Digest::SHA256.new

  has_many :questions

  validates :email, :username, presence: true
  validates :email, :username, uniqueness: true

  attr_accessor :password

  validates_presence_of :password, on: :create
  validates_confirmation_of :password

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  validates :username, length: { maximum: 40 }

  validates :username, format: { with: /\A[a-zA-Z0-9_]+\z/, message: 'can only contain letters, digits, and underscores' }

  before_save :encrypt_password

  before_save :downcase_username

  def downcase_username
    self.username = username.downcase if username.present?
  end

  def encrypt_password
    if self.password.present?
      self.password_salt = User.hash_to_string(OpenSSL::Random.random_bytes(16))

      self.password_hash = User.hash_to_string(
        OpenSSL::PKCS5.pbkdf2_hmac(self.password, self.password_salt, ITERATTIONS, DIGEST.length, DIGEST)
      )
    end
  end

  def self.hash_to_string(password_hash)
    password_hash.unpack('H*')[0]
  end

  def self.authenticate(email, password)
    user = find_by(email: email)

    if user.present? && user.password_hash == User.hash_to_string(OpenSSL::PKCS5.pbkdf2_hmac(password, user.password_salt, ITERATTIONS, DIGEST.length, DIGEST))
      user
    else
      nil
    end
  end
end
