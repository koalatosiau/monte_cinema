require 'rails_helper'

RSpec.describe Reservation, type: :model do
  describe 'validation' do
    it { is_expected.to(validate_presence_of(:quantity)) }
    it { is_expected.to(validate_numericality_of(:quantity).is_greater_than_or_equal_to(1)) }
    it { is_expected.to validate_inclusion_of(:status).in_array(%w[pending confirmed cancelled]) }
  end
end
