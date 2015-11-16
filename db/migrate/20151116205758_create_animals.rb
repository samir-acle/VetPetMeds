class CreateAnimals < ActiveRecord::Migration
  def change
    create_table :animals do |t|
      t.string :name
      # make float instead?
      # add null false?
      t.integer :weight
      t.string :type
    end
  end
end
