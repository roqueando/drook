class User < ApplicationRecord
  validates :name, :email, :password, presence: true
  validates :email, uniqueness: true
  has_secure_password

  has_many_attached :audios
  has_many :audios
end
