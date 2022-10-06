require 'rails_helper'

RSpec.describe Seat, type: :model do
  describe 'validation' do
    it { is_expected.to(validate_presence_of(:number)) }
  end
end
