class AddConcenrationToDrugs < ActiveRecord::Migration
  def change
    add_column :drugs, :concentration, :string
  end
end
