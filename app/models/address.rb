class Address < ApplicationRecord
  validates :calle, :ciudad, presence: true
end
