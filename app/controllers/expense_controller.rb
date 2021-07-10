class ExpenseController < ApplicationController
    def index
        @expenses = Expense.where(user: current_user).order(updated_at: :desc)
    end

    def new
        @expense = current_user.expense.build
    end

    def create
        @expense = current_user.expense.build(expense_params)
        if @expense.save
            redirect_to '/'
        end
    end

    def edit
        @expense = Expense.find(params[:id])
    end

    def updated
    end

    def delete
    end

    private 
    def expense_params
        params.require(:expense).permit(:account_id,:expense_title,:money,:purpose)
    end
end
