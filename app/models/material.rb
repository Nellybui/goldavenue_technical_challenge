class Material < ApplicationRecord

  belongs_to :material_type
  belongs_to :jewel

  validates :name, presence: true
  validates :base_cost, presence: true
  validates :material_type, presence: true
  validates :jewel, presence: true

end
