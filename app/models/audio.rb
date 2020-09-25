class Audio < ApplicationRecord
  belongs_to :user, optional: true
  has_many :favorite
  has_one_attached :path
end
