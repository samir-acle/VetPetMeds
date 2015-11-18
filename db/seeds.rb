# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Animal.create(name: 'Addy', weight: 28, species: 'dog')
Animal.create(name: 'Duma', weight: 42, species: 'dog')
Animal.create(name: 'Koda', weight: 18, species: 'cat')

# TODO: add column for drug size
# TODO: add clumn for pre-med or induction
Drug.create(name: 'Morphine', dosing: 0.3, route: 'IM or SC', notes: 'Can give up to 1mg/kg with a 50mg maximum dose', restrictions: 'dog')
Drug.create(name: 'Acepromazine', dosing: 0.12, route: 'IM or SC', notes: 'Causes vomiting. To dilute Ace 10mg/ml draw up to 0.1cc Ace with 1cc NaCl')
Drug.create(name: 'Ketamine', dosing: 0.13, route: 'IV')
Drug.create(name: 'Midazolam', dosing: 0.13, route: 'IV')

# TODO: fix below dosing
Drug.create(name: 'Buprenorphine', dosing: 0.03, route: 'IM or SC')
