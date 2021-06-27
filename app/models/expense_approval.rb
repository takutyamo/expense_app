class ExpenseApproval < ApplicationRecord
  belongs_to :expense
  belongs_to :user

  enum approval: {
    unconfirmed: 0,
    approval: 1,
    dismissal: 2
  }

  scope :today, -> { where(updated_at: Time.zone.today.beginning_of_day..Time.zone.today.end_of_day) }
  scope :yesterday, -> { where(updated_at: Time.zone.yesterday.beginning_of_day..Time.zone.yesterday.end_of_day) }
  scope :this_month, -> { where(updated_at: Time.zone.today.beginning_of_month..Time.zone.today.end_of_month) }
  scope :last_month, -> { where(updated_at: Time.zone.today.beginning_of_month-1.month..Time.zone.today.end_of_month-1.month) }
end
