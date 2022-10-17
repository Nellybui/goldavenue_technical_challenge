class JewelDestroy < ApplicationService

  attr_accessor :jewel

  def initialize(jewel)
    @jewel = jewel
  end

  def call
    jeweler = @jewel.jeweler
    if success = @jewel.destroy
      success &= JewelerWealthCalculator.call(jeweler)
    end
    success
  end

end