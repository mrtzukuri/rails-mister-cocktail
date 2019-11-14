# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'json'
require 'faker'

p "Creating seeds"

Ingredient.destroy_all
Cocktail.destroy_all

ingredients = JSON.parse(open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read)

ingredients['drinks'].each { |hash| Ingredient.create(name: hash['strIngredient1']) }

10.times do
  Cocktail.create(name: Faker::Coffee.blend_name)
end

p "Finished seeds."
