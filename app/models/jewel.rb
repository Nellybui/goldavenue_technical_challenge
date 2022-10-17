class Jewel < ApplicationRecord

  belongs_to :jeweler
  has_one :material, dependent: :destroy
  has_many :stones, dependent: :destroy

  accepts_nested_attributes_for :material
  accepts_nested_attributes_for :stones, allow_destroy: true

  validates :name, presence: true
  validates :jeweler, :presence => true
  validates :material, :presence => true

end
