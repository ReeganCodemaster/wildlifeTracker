class Animal < ApplicationRecord
    has_many :sightings
    validates :animal , presence: true
end
