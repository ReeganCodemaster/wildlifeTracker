class Animal < ApplicationRecord
    has_many :sightings, dependent: :destroy
    validates :animal , presence: true, length: {minimum: 5}
end
