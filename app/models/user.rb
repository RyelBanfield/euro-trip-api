class User < ApplicationRecord
  has_many :favourites, foreign_key: 'sub', primary_key: 'sub'
  validates_presence_of :sub
end
