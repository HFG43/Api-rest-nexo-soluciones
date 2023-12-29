class Person < ApplicationRecord
  has_many :addresses, class_name: 'Address', foreign_key: 'dni', dependent: :destroy

  validates :dni, numericality: { only_integer: true, greater_than: 0 }
  validates :dni, length: { is: 8 }
  validates :nombre, :apellido, :edad, :foto, presence: true
  validates :edad, comparison: { greater_than: 0, less_than: 99 }, numericality: { only_integer: true }
end
