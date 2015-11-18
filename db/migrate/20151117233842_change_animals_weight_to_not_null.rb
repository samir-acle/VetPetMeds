class ChangeAnimalsWeightToNotNull < ActiveRecord::Migration
  def change
    change_column :animals, :weight, :integer, :null => false
  end
end
