class JewelCreateOrUpdate < ApplicationService

  attr_accessor :jewel

  def initialize(jewel)
    @jewel = jewel
  end

  def call
    jeweler = @jewel.jeweler
    if success = @jewel.save
      success &= JewelPriceCalculator.call(@jewel)
      success &= JewelerWealthCalculator.call(jeweler)
    end
    success
  end

end