class Expense < ApplicationRecord
  belongs_to :user
  belongs_to :account
  has_one :expense_approval

  validates :expense_title, presence: true
  validates :money, presence: true

  #enum account_id: {
  #  事務用品費: 1,
  #  雑費: 2,
  #  交通費: 3,
  #  接待交際費: 4,
  #}

end
