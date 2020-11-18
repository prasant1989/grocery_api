# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
categories = [
    {name: 'Oil', is_active: true},
    {name: 'Noodles', is_active: true},
    {name: 'Biscuit', is_active: true},
    {name: 'Choclate', is_active: true},
    {name: 'Pulses', is_active: true},
    {name: 'Seeds', is_active: true},
    {name: 'Rice', is_active: true},
    {name: 'Snacks', is_active: true},
    {name: 'Soap', is_active: true},
    {name: 'Others', is_active: true},
    {name: 'Ghee', is_active: true},
    {name: 'Flour', is_active: true},
    {name: 'Rice', is_active: true},
]
categories.each do |category|
  Category.find_or_create_by(category)
end

catalogs = [
    {name: 'Aashirvad Aata', unit: "KG", price: 38, category_id: Category.find_by(name: 'Flour').id},
    {name: 'Fortune Aata', unit: "KG", price: 40, category_id: Category.find_by(name: 'Flour').id},
    {name: 'Honey', unit: "LTR", price: 450, category_id: Category.find_by(name: 'Others').id},
    {name: 'Govardhan Ghee', unit: "KG", price: 310, category_id: Category.find_by(name: 'Ghee').id},
    {name: 'Balaji Ghee', unit: "KG", price: 110, category_id: Category.find_by(name: 'Ghee').id},
    {name: 'Maida', unit: "KG", price: 35, category_id: Category.find_by(name: 'Flour').id},
    {name: 'Yipee pack of 4', unit: "KG", price: 46, category_id: Category.find_by(name: 'Noodles').id},
    {name: 'Yipee pack of 6', unit: "KG", price: 68, category_id: Category.find_by(name: 'Noodles').id},
    {name: 'Sugar', unit: "KG", price: 40, category_id: Category.find_by(name: 'Others').id},
    {name: 'Onion', unit: "KG", price: 65, category_id: Category.find_by(name: 'Others').id},
    {name: 'Potato', unit: "KG", price: 40, category_id: Category.find_by(name: 'Others').id},
    {name: 'Kolam Rice platinum', unit: "UNIT", price: 800, category_id: Category.find_by(name: 'Rice').id},
    {name: 'Kolam Rice Premium', unit: "UNIT", price: 950, category_id: Category.find_by(name: 'Rice').id},
    {name: 'Golden Eagle', unit: "UNIT", price: 930, category_id: Category.find_by(name: 'Rice').id},
    {name: 'Kashmir Keshari', unit: "UNIT", price: 1250, category_id: Category.find_by(name: 'Rice').id},
    {name: 'Super Mahadev', unit: "UNIT", price: 700, category_id: Category.find_by(name: 'Rice').id},
    {name: 'Arua Rice', unit: "UNIT", price: 550, category_id: Category.find_by(name: 'Rice').id},
    {name: 'Palm Oil', unit: "LTR", price: 95, category_id: Category.find_by(name: 'Oil').id},
    {name: 'Refine Oil', unit: "LTR", price: 120, category_id: Category.find_by(name: 'Oil').id},
    {name: 'Mustard Seeds', unit: "KG", price: 100, category_id: Category.find_by(name: 'Others').id},
    {name: 'Ginger', unit: "KG", price: 120, category_id: Category.find_by(name: 'Others').id},
    {name: 'Poha', unit: "KG", price: 50, category_id: Category.find_by(name: 'Flour').id},
    {name: 'GARLIC', unit: "KG", price: 150, category_id: Category.find_by(name: 'Others').id},
    {name: 'CUMMIN SEED', unit: "KG", price: 100, category_id: Category.find_by(name: 'Others').id},
    {name: 'AGARBATI', unit: "UNIT", price: 50, category_id: Category.find_by(name: 'Others').id},
    {name: 'LIZOL LIQUID', unit: "UNIT", price: 120, category_id: Category.find_by(name: 'Others').id},
]

catalogs.each do |catalog|
  Catalog.find_or_create_by(catalog)
end
