class Animal < ActiveRecord::Base
  has_many :doses
  has_many :drugs, through: :doses, dependent: :destroy
end
