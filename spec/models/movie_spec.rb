require 'rails_helper'

RSpec.describe Movie, type: :model do

  describe 'validation' do
    it { is_expected.to(validate_presence_of(:title)) }
    it { is_expected.to(validate_presence_of(:runtime)) }
    it { is_expected.to(validate_length_of(:description).is_at_most(500)) }
    it { is_expected.to(validate_numericality_of(:runtime).is_greater_than_or_equal_to(0)) }
  end
end
