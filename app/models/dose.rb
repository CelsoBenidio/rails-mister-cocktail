class Dose < ApplicationRecord

  belongs_to :cocktail
  belongs_to :ingredient
  validates :description, presence: true
  validates_uniqueness_of :cocktail, :scope => :ingredient
  # A dose must have a description, a cocktail and an ingredient, and [cocktail, ingredient] pairings should be unique. -
  # is unique for a given cocktail/ingredient couple (FAILED - 8)
end
