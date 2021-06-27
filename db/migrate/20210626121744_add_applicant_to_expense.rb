class AddApplicantToExpense < ActiveRecord::Migration[6.1]
  def change
    add_column :expenses, :applicant, :boolean, default:false
  end
end
