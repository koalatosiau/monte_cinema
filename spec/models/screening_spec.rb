require 'rails_helper'

RSpec.describe Screening, type: :model do
  describe 'validation' do
    it { is_expected.to(validate_presence_of(:start)) }
  end
end
