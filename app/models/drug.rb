class Drug < ActiveRecord::Base
  has_many :doses
end
