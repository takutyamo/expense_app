class CreateExpenseApprovals < ActiveRecord::Migration[6.1]
  def change
    create_table :expense_approvals do |t|
      t.references :expense, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :comment
      t.integer :approval
      t.date :approval_date

      t.timestamps
    end

    add_index :expense_approvals, [:expense_id,:user_id], unique: true
  end
end
