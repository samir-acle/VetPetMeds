class Animal < ActiveRecord::Base
  has_many :doses
  has_many :drugs, through: :doses, dependent: :destroy
  validates :species, inclusion: { in: ['cat','dog']}
  validates :weight, :name, presence: true
end
