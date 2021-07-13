class ExpenseController < ApplicationController
    before_action :require_login

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

    def update
        @expense = Expense.find(params[:id])
        if @expense.update(expense_params)
            redirect_to '/expense'
        end
    end

    def delete
    end

    private 
    def expense_params
        params.require(:expense).permit(:account_id,:expense_title,:money,:purpose)
    end

    def require_login
        unless current_user
            redirect_to new_user_session_path
        end
    end
end
