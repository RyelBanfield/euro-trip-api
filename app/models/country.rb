class Country < ApplicationRecord
  has_many :favourites
  has_many :users, through: :favourites
  has_many :images

  validates :name, :capital, :population, :language, :demonym, :currency, :flag, presence: true
end
