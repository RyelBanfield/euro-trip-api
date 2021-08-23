class User < ApplicationRecord
  validates_presence_of :sub, :email, :name, :given_name, :family_name, :picture
end
