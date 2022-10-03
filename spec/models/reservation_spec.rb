require 'rails_helper'

RSpec.describe Reservation, type: :model do
  describe 'validation' do
    it { is_expected.to(validate_presence_of(:quantity)) }
    it { is_expected.to(validate_numericality_of(:quantity).is_greater_than_or_equal_to(1)) }
    it { is_expected.to(validate_presence_of(:status)) }
    it { is_expected.to(validate_presence_of(:email)) }
  end
end
