class Country < ApplicationRecord
  belongs_to :favourite, foreign_key: 'country', primary_key: 'name', optional: true
end
