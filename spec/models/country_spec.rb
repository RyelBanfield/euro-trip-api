require 'rails_helper'

RSpec.describe Country, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:capital) }
    it { should validate_presence_of(:population) }
    it { should validate_presence_of(:language) }
    it { should validate_presence_of(:demonym) }
    it { should validate_presence_of(:currency) }
    it { should validate_presence_of(:flag) }
  end

  describe 'associations' do
    it { should have_many(:favourites) }
    it { should have_many(:users) }
    it { should have_many(:images) }
  end
end
