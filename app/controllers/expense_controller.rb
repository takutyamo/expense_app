class ExpenseController < ApplicationController
    def index
        @expenses = Expense.where(user: current_user)
    end

    def show
        @expense = Expense.find(params[:id])
    end

    def new
        @expense = current_user.expense.build
    end

    def create
        @expense = current_user.expense.build(expense_params)
        if @expense.save
            puts 'create'
            redirect_to '/'
        end
    end

    private 
    def expense_params
        params.require(:expense).permit(:account_id,:expense_title,:money,:purpose)
    end
end
