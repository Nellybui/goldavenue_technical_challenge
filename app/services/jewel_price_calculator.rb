class JewelPriceCalculator < ApplicationService
  
  attr_accessor :jewel

  def initialize(jewel)
    @jewel = jewel
  end

  def call
    material = @jewel.material
    stones = @jewel.stones
    price = material.base_cost + stones.map(&:price).sum
    @jewel.update(price: price)
  end

end