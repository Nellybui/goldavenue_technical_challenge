require 'rails_helper'

RSpec.describe 'Scénario 3 - suppression de bijoux', type: :feature do
  scenario 'Deleting a jewel and seeing total values change on homepage' do
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

    material = Material.new(name: "Gold", base_cost: 50, material_type_id: gold.id)
    stone = Stone.new(name: "Diamond", price: 200, stone_type_id: diamond.id)
    jewel = jeweler.jewels.new(name: "Necklace")
    jewel.material = material
    jewel.stones << stone
    JewelCreateOrUpdate.call(jewel)

    visit root_path
    expect(page).to have_content('total value of CHF 400.00')
    expect(page).to have_content('Gold 400.00')
    expect(page).to have_content('Ruby 150.00')
    expect(page).to have_content('Diamond 250.00')

    visit jeweler_jewel_path(jeweler, jewel)
    click_on 'Delete'

    visit root_path
    expect(page).to have_content('total value of CHF 150.00')
    expect(page).to have_content('Gold 150.00')
    expect(page).to have_content('Ruby 150.00')
    expect(page).to have_content('Diamond 0.00')
  end
end