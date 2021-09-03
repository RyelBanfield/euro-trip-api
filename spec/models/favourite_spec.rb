require 'rails_helper'

RSpec.describe Favourite, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:country) }
  end

  describe 'validations' do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:country_id) }
  end
end
