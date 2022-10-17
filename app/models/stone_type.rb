class StoneType < ApplicationRecord

  has_many :stones, dependent: :destroy
  has_many :jewels, through: :stones

  validates :name, presence: true, uniqueness: true

end
