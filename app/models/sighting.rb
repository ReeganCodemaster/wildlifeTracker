class Sighting < ApplicationRecord
  belongs_to :animal
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :date, presence: true

end
