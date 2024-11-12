class User < ApplicationRecord
  has_secure_password
  has_many :daycare_slots
  has_many :pokemons
  has_one_attached :avatar

  validates :username, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 }, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }, if: :password_digest_changed?
  validates :avatar, content_type: [:png, :jpg, :jpeg], size: { less_than: 5.megabytes }
  validates :bio, length: { maximum: 500 }, allow_blank: true
  before_save { self.email = email.downcase }

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
