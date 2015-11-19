class AddImageUrlToDrugs < ActiveRecord::Migration
  def change
    add_column :drugs, :image_url, :string
  end
end

# TODO: change floats to decimals
