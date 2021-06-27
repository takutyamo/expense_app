class ExpenseApprovalController < ApplicationController
    def index
        company = current_user.company
        employee = User.where(company: company)
        @approval = ExpenseApproval.where(user: employee).order(created_at: :desc)
    end

    def create
        expense = Expense.find(params[:id])
        user = current_user
        @approval = expense.build_expense_approval
        @approval.user = current_user
        @approval.approval = 0
        puts @approval.expense
        if @approval.save
            puts 'save'
            expense.applicant = true
            expense.save
            redirect_to '/'
        end
    end

    def update
        approval = ExpenseApproval.find(params[:id])
        approval.comment = params[:expense_approval][:comment]
        approval.approval = 2
        approval.save
        redirect_to '/'
    end

    def approval
        approval = ExpenseApproval.find(params[:id])
        approval.approval = 1
        approval.save
        redirect_to '/'
    end

    def show
        @approval = ExpenseApproval.find(params[:id])
    end

end
