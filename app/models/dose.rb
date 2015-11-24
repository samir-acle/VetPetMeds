class Dose < ActiveRecord::Base
  belongs_to :animal
  belongs_to :drug
  belongs_to :user
  validates :drug_id, presence: true
  validate :restrictions
  before_save :calculate_dosage

  private
    def calculate_dosage
      self.dosage = ( self.animal.weight / 10.0 ) * self.drug.dosing
    end

    def restrictions
      if self.drug
        @restriction = self.drug.restrictions
        # This variable has a singular name, but seems to contain a collection?
        errors.add(:restriction, "- this drug is for #{@restriction}s only") if
          !@restriction.blank? and @restriction != self.animal.species
        # Interesting syntax! I might split this up into multiple lines too
        # The whole 5-line-method thing shouldn't come at the expense of readability!
      end
    end
end
