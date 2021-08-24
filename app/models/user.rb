class User < ApplicationRecord
  has_many :favourites
  has_many :countries, through: :favourites

  validates :sub, :email, presence: true, :uniqueness => {:case_sensitive => false}
  validates :name, presence: true
end
