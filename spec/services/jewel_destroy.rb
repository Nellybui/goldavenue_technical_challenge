require 'rails_helper'

RSpec.describe JewelDestroy, type: :model do
  scenario 'Destroying a jewel and seeing jeweler wealth diminishing' do
    gold = MaterialType.create!(name: "Gold")
    ruby = StoneType.create!(name: "Ruby")
    diamond = StoneType.create!(name: "Diamond")
    jeweler = Jeweler.create!(name: "Jean")

    material = Material.new(name: "Gold", base_cost: 50, material_type_id: gold.id)
    stone = Stone.new(name: "Ruby", price: 100, stone_type_id: ruby.id)
    jewel = jeweler.jewels.new(name: "Bracelet")
    jewel.material = material
    jewel.stones << stone
    JewelCreateOrUpdate.call(jewel)

    expect(jeweler.wealth).to eq(150)
    jewel.reload
    JewelDestroy.call(jewel)
    expect(jewel.destroyed?).to eq(true)
    jeweler.reload
    expect(jeweler.wealth).to eq(0)
  end
end