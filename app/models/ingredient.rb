class Ingredient < ApplicationRecord

  validates :name, presence: true, uniqueness: true

  has_many :doses

  # should not be able to destroy self if has dose children (FAILED - 10)


end
