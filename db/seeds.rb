# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create([
  { name: 'Toys' },
  { name: 'Groceries' },
  { name: 'Sports and Outdoors' }
])

Product.create([
  { 
    name: 'Legos',
    price: 3000,
    description: 'A lego set.',
    category: categories.first
  },
  {
    name: 'Apples',
    price: 500,
    description: 'A bag of apples.',
    category: categories.second
  },
  {
    name: 'Soccer Ball',
    price: 2000,
    description: 'A size 5 soccer ball',
    category: categories.third
  }
])