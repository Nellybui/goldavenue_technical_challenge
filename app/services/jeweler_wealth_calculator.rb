class JewelerWealthCalculator < ApplicationService
  
  attr_accessor :jeweler

  def initialize(jeweler)
    @jeweler = jeweler
  end

  def call
    jewels = @jeweler.jewels
    wealth = jewels.map(&:price).sum
    @jeweler.update(wealth: wealth)
  end

end