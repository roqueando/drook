class Favorite < ApplicationRecord
  belongs_to :audio, optional: true
  belongs_to :user, optional: true
end
