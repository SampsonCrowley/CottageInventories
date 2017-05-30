# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.connection.execute("DELETE FROM categories")
Category.create name: 'Topsheet & Base Materials', description: 'Topsheets, Bottom Sheets, Be specific as you can: include customer and basic graphic description'
Category.create name: 'Glues, Epoxies, Paints, & Agents', description: 'Epoxies and Hardeners, Super Glue, Release Agent, Etc..'
Category.create name: 'Lumber', description: 'All wooden materials go into this category'
Category.create name: 'Tape', description: 'Double Sided Carpet Tape, Edge Tape, Etc..'
Category.create name: 'Other', description: 'Fiberglass, Sidewalls, Etc..'
