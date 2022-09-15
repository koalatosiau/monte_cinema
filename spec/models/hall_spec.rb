require 'rails_helper'

RSpec.describe(Hall, type: :model) do
  let(:hall) { create :hall }

  context 'validation' do
    it { is_expected.to(validate_presence_of(:name)) }
    it { is_expected.to(validate_presence_of(:capacity)) }
    it { is_expected.to(validate_numericality_of(:capacity).is_greater_than(0)) }
    it do
      hall
      is_expected.to(validate_uniqueness_of(:name))
    end
  end
end
