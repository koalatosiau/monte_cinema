require 'rails_helper'

RSpec.describe(ReservationForm, type: :model) do
  let(:screening) { create :screening }
  let(:form) { ReservationForm.new(screening) }

  context "when params are valid" do
    let(:valid_params) {{ email: 'guest@example.com', numbers: ['2', '3'] }}
    it "creates a new reservation with seats" do
      expect do
        form.submit(valid_params)
      end.to change(Reservation, :count).by(1).and change(Seat, :count).by(2)
    end

    it "schedules a cancel reservation job" do
      ActiveJob::Base.queue_adapter = :test
      expect do
        form.submit(valid_params)
      end.to have_enqueued_job(Reservations::CancelJob)
    end
  end

  context "when params are empty" do
    let(:empty_params) {{ email: '', numbers: [''] }}

    it "does not create a new reservation nor seats" do
      expect do
        form.submit(empty_params)
      end.to change(Reservation, :count).by(0).and change(Seat, :count).by(0)
    end

    it "returns errors" do
      form.submit(empty_params)
      expect(form.errors.full_messages.to_sentence).to eq("Email can't be blank and Numbers can't be blank")
    end
  end

  context "when numbers are duplicated" do
    let(:duplicated_params) {{ email: 'guest@example.com', numbers: ['1', '1'] }}

    it "does not create a new reservation nor seats" do
      expect do
        form.submit(duplicated_params)
      end.to change(Reservation, :count).by(0).and change(Seat, :count).by(0)
    end

    it "returns errors" do
      form.submit(duplicated_params)
      expect(form.errors.full_messages.to_sentence).to eq("Numbers has already been taken")
    end
  end

  context "when seats are already taken" do
    let(:invalid_params) {{ email: 'guest1@example.com', numbers: ['1', '2'] }}
    before do
      screening.reservations.create(email: 'guest2@example.com', seats_attributes: [{number: 1}])
    end

    it "does not create a new reservation nor seats" do
      expect do
        form.submit(invalid_params)
      end.to change(Reservation, :count).by(0).and change(Seat, :count).by(0)
    end

    it "returns errors" do
      form.submit(invalid_params)
      expect(form.errors.full_messages.to_sentence).to eq("Numbers has already been taken")
    end
  end
end
