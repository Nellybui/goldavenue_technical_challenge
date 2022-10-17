# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

MaterialType.create(name: "Gold")
MaterialType.create(name: "Silver")
MaterialType.create(name: "Copper")

StoneType.create(name: "Ruby")
StoneType.create(name: "Diamond")
StoneType.create(name: "Emerald")
StoneType.create(name: "Sapphire")

["Jean", "Marie", "Julien", "Amelle", "David", "Estelle", "Mathieu", "Camille"].each do |name|
  JewelerWithJewelsCreator.call(name)
end