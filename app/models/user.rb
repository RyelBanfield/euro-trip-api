class User < ApplicationRecord
  has_many :favourites
  has_many :countries, :through => :favourites
end
