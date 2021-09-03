class Favourite < ApplicationRecord
  belongs_to :user
  belongs_to :country

  validates :user_id, presence: true, uniqueness: { scope: :country_id }
  validates :country_id, presence: true
end
