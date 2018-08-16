class Review < ApplicationRecord
  belongs_to :cocktail
  validates :cocktail, presence: true
  validates :content, presence: true
  validates :rating, inclusion: 0..5, presence: true, numericality: { only_integer: true }
end
