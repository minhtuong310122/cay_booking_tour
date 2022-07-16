class Tour < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  enum tour_type: { military_tour: 0, fixed_tour: 1 }

  validates :title, :price, :description, presence: true
  validates :time_in_day, presence: true, if: :fixed_tour?
  validates :start_date, :end_date, presence: true, if: :military_tour?
  validate :should_have_time_in_day, if: :military_tour?
  validate :should_not_have_start_day, if: :fixed_tour?
  validate :should_not_have_end_day, if: :fixed_tour?
  validate :start_date_should_not_bigger_end_date, if: :military_tour?

  private

  def should_have_time_in_day
    errors.add(:time_in_day, "must enter a fixed date and time") if time_in_day.present?
  end

  def should_not_have_start_day
    errors.add(:start_day, "should can't fill") if start_date.present?
  end

  def should_not_have_end_day
    errors.add(:end_date, "should can't fill") if end_date.present?
  end

  def start_date_should_not_bigger_end_date
    return if start_date.blank? && end_date.blank?

    errors.add(:start_date, "should not bigger end date") if start_date > end_date
  end
end
