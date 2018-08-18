class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  has_many :reviews
  validates :name, uniqueness: :true, presence: :true
  validates :image_url, allow_blank: true, format: { with: %r{\Ahttp(s?):\/\/.+(\.(png|jpg|gif|jpeg))\Z}, message: 'must be a URL for GIF, JPG or PNG image.' }
end
