require 'rails_helper'

RSpec.describe Reservation, type: :model do
  describe 'validation' do
    it { is_expected.to(validate_presence_of(:status)) }
    it { is_expected.to(validate_presence_of(:email)) }
  end
end
