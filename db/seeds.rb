# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Animal.destroy_all
Drug.destroy_all

Animal.create(name: 'Addy', weight: 28, species: 'dog')
Animal.create(name: 'Duma', weight: 42, species: 'dog')
Animal.create(name: 'Koda', weight: 14, species: 'cat')
Animal.create(name: 'Milo', weight: 11, species: 'cat')
Animal.create(name: 'Yuki', weight: 13, species: 'cat')
Animal.create(name: 'Kiwi', weight: 10, species: 'cat')

# You can use AR's bulk creation method as well:
=begin
Animal.create([
  {name: 'Addy', weight: 28, species: 'dog'},
  {name: 'Duma', weight: 42, species: 'dog'},
  ...
])
=end

Drug.create(name: 'Morphine', dosing: 0.3, route: 'IM or SC', concentration: '15 mg/ml', notes: 'Can give up to 1mg/kg with a 50mg maximum dose', restrictions: 'dog')
Drug.create(name: 'Acepromazine', dosing: 0.12, route: 'IM or SC', concentration: '1 mg/ml', notes: 'Causes vomiting. To dilute Ace 10mg/ml draw up to 0.1cc Ace with 1cc NaCl')
Drug.create(name: 'Ketamine', dosing: 0.13, route: 'IV', concentration: '100 mg/ml')
Drug.create(name: 'Midazolam', dosing: 0.13, route: 'IV', concentration: '5 mg/ml')

# TODO: fix below dosing
Drug.create(name: 'Buprenorphine', dosing: 0.03, route: 'IM or SC', concentration: '0.3 mg/ml', restrictions: 'cat')
Drug.create(name: 'Cefazolin', dosing: 1.0, concentration: '100 mg/ml', notes: 'to mix add 9.6cc NaCl, only good 10 days in fridge')
