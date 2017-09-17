class User < ApplicationRecord
  has_many :orders
  has_one :current_order # solely used for finding cart
  has_one :cart, through: :current_order, source: :order, dependent: :destroy
  validates :email,
    presence: true,
    uniqueness: { case_sensitive: false },
    format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i },
    length: { maximum: 255 }
  has_secure_password
  validates :password,
    presence: true,
    length: { minimum: 8 },
    allow_nil: true
  validates :admin, inclusion: { in: [true, false] }
  attr_accessor :remember_token

  class << self
    def create_hash(string)
      BCrypt::Password.create(string)
    end

    def generate_token
      SecureRandom.urlsafe_base64
    end
  end

  def remember
    self.remember_token = User.generate_token
    update_attribute(:remember_digest, User.create_hash(remember_token))
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  def authenticated?(attribute, token)
    digest = self["#{attribute}_digest"] # to symbol? send?
    # digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end
end
