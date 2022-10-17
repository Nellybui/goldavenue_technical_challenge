class JewelCreateOrUpdate < ApplicationService

  attr_accessor :jewel

  def initialize(jewel)
    @jewel = jewel
  end

  def call
    jeweler = @jewel.jeweler
    if success = @jewel.save
      JewelPriceCalculator.call(@jewel)
      JewelerWealthCalculator.call(jeweler)
    end
    success
  end

end