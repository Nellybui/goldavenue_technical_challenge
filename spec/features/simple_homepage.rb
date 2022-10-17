require 'rails_helper'

RSpec.describe 'Scénario 1 - homepage simple', type: :feature do
  scenario 'Seeing the number of jewelers, the material types and the stone types' do
    MaterialType.create!(name: "Gold")
    StoneType.create!(name: "Ruby")
    StoneType.create!(name: "Diamond")
    JewelerWithJewelsCreator.call("Jean")
    visit root_path
    expect(page).to have_content('1 Jeweler')
    expect(page).to have_content('Gold')
    expect(page).to have_content('Ruby')
    expect(page).to have_content('Diamond')
  end
end