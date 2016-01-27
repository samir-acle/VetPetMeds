class Animal < ActiveRecord::Base
  has_many :doses
  has_many :drugs, through: :doses, dependent: :destroy
  # validates :species, inclusion: { in: ['cat','dog']}
  validates :species, inclusion: { in: %w"cat dog"}
  # You could save two whole characters!
  validates :weight, :name, presence: true
end
