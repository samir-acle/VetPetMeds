require 'rails_helper'

describe Dose, :type => :model do
  before(:all) do
    @drug = Drug.create(name: 'Morphine', dosing: 0.3, restrictions: 'dog')
    @dog = Animal.create(name: 'dog', weight: 30, species: 'dog')
  end

  it 'contains a dosage value that is based on the animal weight and drug' do
    dose = Dose.create(animal: @dog, drug: @drug)
    expect(dose.dosage).to eq @drug.dosing * ( @dog.weight / 10.0 )
  end

  it 'is invalid with incompatible drugs' do
    @cat = Animal.create(name: 'cat', weight: 20, species: 'cat')
    dose = Dose.new(animal: @cat, drug: @drug)
    dose.valid?
    expect(dose.errors[:restriction]).to include("- this drug is for dogs only")
  end

  it 'is valid with compatible drugs' do
    dose = Dose.new(animal: @dog, drug: @drug)
    expect(dose).to be_valid
  end
end
