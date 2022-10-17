class Stone < ApplicationRecord

  belongs_to :stone_type
  belongs_to :jewel

  validates :name, presence: true
  validates :price, presence: true
  validates :stone_type, presence: true
  validates :jewel, presence: true

end
