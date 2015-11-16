class CreateDrugs < ActiveRecord::Migration
  def change
    create_table :drugs do |t|
      t.string :name
      # add null false
      t.float :dosing
      t.string :route
      t.string :restrictions
      t.text :notes
    end
  end
end
