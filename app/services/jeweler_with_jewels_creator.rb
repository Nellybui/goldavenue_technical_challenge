class JewelerWithJewelsCreator < ApplicationService

  attr_reader :name

  JEWEL_NAMES = ["Bracelet", "Pendant", "Necklace", "Ring", "Earrings"]
  MATERIAL_TYPES = MaterialType.order(:id)
  STONE_TYPES = StoneType.order(:id)

  def initialize(name)
    @name = name
  end

  def call
    jeweler = Jeweler.create(name: name)
    rand(1..6).times do
      create_jewel(jeweler)      
    end
    JewelerWealthCalculator.call(jeweler)
  end

private

  def create_jewel(jeweler)
    jewel = jeweler.jewels.new
      jewel.material = build_material

      rand(0..4).times do
        jewel.stones << build_stone
      end

      jewel.name = jewel_name(jewel)

      jewel.save
      JewelPriceCalculator.call(jewel)
  end

  def build_material
    material = Material.new
    material.material_type = MATERIAL_TYPES.sample
    material.name = material.material_type.name
    material.base_cost = rand(1..12) * 10
    material
  end

  def build_stone
    stone = Stone.new
    stone.stone_type = STONE_TYPES.sample
    stone.name = stone.stone_type.name
    stone.price = rand(5..120) * 10
    stone
  end

  def jewel_name(jewel)
    if jewel.stones.present?
      "%s (%s - %s)" % [JEWEL_NAMES.sample, material_name(jewel.material), stones_name(jewel.stones)]
    else
      "%s (%s)" % [JEWEL_NAMES.sample, material_name(jewel.material)]
    end
  end

  def material_name(material)
    material.material_type.name
  end

  def stones_name(stones)
    stones.group_by{|stone| stone.stone_type.name}
      .sort_by{|stone_type, stones| stones.map(&:price).sum}
      .reverse
      .map{|stone_type, stones| stones.length > 1 ? "%s x%i" % [stone_type, stones.length] : stone_type}
      .join('/')
  end

end