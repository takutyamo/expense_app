class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable
  #       :recoverable, :rememberable, :validatable
  belongs_to :company
  has_many :expense
  has_many :expense_approval
  
end
