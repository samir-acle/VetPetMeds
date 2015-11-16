class CreateDoses < ActiveRecord::Migration
  def change
    create_table :doses do |t|
      t.references :animal, index: true, foreign_key: true
      t.references :drug, index: true, foreign_key: true
      t.float :dosage
      t.text :notes
      t.timestamps null: false
    end
  end
end
