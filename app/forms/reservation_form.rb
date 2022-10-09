class ReservationForm
  include ActiveModel::Model

  validates :email, presence: true, unless: :user?
  validate :user_email, if: :user?
  validate :numbers_presence
  validate :numbers_uniq


  attr_accessor :screening, :email, :numbers, :current_user

  def initialize(screening)
    @screening = screening
  end

  def submit(params)
    assign_attributes(params)
    return false if invalid?

    @screening.reservations.create!(reservation_attributes)
  end

  private

  def user?
    current_user&.user?
  end

  def reservation_attributes
    { email: email.presence || current_user.email }.merge(seats_attributes)
  end

  def seats_attributes
    seats_numbers = numbers.compact_blank!.map do |number|
      { number: number }
    end
    { seats_attributes: seats_numbers }
  end

  def numbers_presence
    return if numbers.any?

    errors.add(:numbers, :blank)
  end

  def numbers_uniq
    return if numbers.uniq.count == numbers.count

    errors.add(:numbers, :taken)
  end

  def user_email
    return if email.nil? || email == current_user.email

    errors.add(:email, :taken)
  end
end
