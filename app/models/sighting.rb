class Sighting < ApplicationRecord
  belongs_to :animal
  belongs_to :region

  validates :latitude, presence: true , comparison: {greater_than: 0}
  validates :longitude, presence: true , comparison: {greater_than: 0}
  validates :date, presence: true
end
