class Dose < ActiveRecord::Base
  belongs_to :animal
  belongs_to :drug
end
