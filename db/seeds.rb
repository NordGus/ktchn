# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Seeding Inventory Units'
Inventory::Unit.find_or_create_by!(name: 'units', category: :count)
Inventory::Unit.find_or_create_by!(name: 'spoons', category: :count)
Inventory::Unit.find_or_create_by!(name: 'little spoons', category: :count)
Inventory::Unit.find_or_create_by!(name: 'grams', category: :mass)
Inventory::Unit.find_or_create_by!(name: 'kilograms', category: :mass)
Inventory::Unit.find_or_create_by!(name: 'liters', category: :volume)
Inventory::Unit.find_or_create_by!(name: 'milliliters', category: :volume)
Inventory::Unit.find_or_create_by!(name: 'cubic meters', category: :volume)
Inventory::Unit.find_or_create_by!(name: 'cubic centimeters', category: :volume)
Inventory::Unit.find_or_create_by!(name: 'meters', category: :length)
Inventory::Unit.find_or_create_by!(name: 'centimeters', category: :length)
Inventory::Unit.find_or_create_by!(name: 'millimeters', category: :length)
Inventory::Unit.find_or_create_by!(name: 'squared meters', category: :surface)
Inventory::Unit.find_or_create_by!(name: 'squared centimeters', category: :surface)