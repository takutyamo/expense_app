class CreateExpenses < ActiveRecord::Migration[6.1]
  def change
    create_table :expenses do |t|
      t.references :user, null: false, foreign_key: true
      t.references :account, null: false, foreign_key: true
      t.string :expense_title
      t.integer :money
      t.text :purpose

      t.timestamps
    end
  end
end
