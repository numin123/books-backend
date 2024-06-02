class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :password, presence: true

  def authenticate(p)
    BCrypt::Password.new(password).is_password?(p)
  end
end
