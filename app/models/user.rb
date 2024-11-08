class User < ApplicationRecord
  has_secure_password
  has_many :daycare_slots
  has_many :pokemons

  validates :username, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 }, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }, if: :password_digest_changed?
  validates :avatar, length: { maximum: 255 },  allow_blank: true
  validates :bio, length: { maximum: 500 }, allow_blank: true
  before_save { self.email = email.downcase }
end
