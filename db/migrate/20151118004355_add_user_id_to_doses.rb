class AddUserIdToDoses < ActiveRecord::Migration
  def change
    add_reference :doses, :user, index: true, foreign_key: true
  end
end
