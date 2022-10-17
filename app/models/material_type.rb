class MaterialType < ApplicationRecord

  has_many :materials, dependent: :destroy
  has_many :jewels, through: :materials

  validates :name, presence: true, uniqueness: true

end
