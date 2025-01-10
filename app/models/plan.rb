class Plan < ApplicationRecord
  validates :title, presence: true, length: { maximum: 20 }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :end_date_not_start_date
  validates :memo, length: { maximum: 500 }

  def end_date_not_start_date
    errors.add(:end_date, "は開始日より過去の日付を選択できません") unless
    self.start_date < self.end_date
  end
end

