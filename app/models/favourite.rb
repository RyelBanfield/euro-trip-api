class Favourite < ApplicationRecord
  belongs_to :user, foreign_key: 'sub', primary_key: 'sub', optional: true
  has_many :countries, foreign_key: 'name', primary_key: 'country'

  validates_presence_of :sub, :country
end
