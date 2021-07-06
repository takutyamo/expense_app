class ExpenseApprovalController < ApplicationController
    def index
        company = current_user.company
        employee = User.where(company: company)
        @approvals = ExpenseApproval.page(params[:page]).per(10).where(user: employee).order(created_at: :desc)
    end

    def create
        expense = Expense.find(params[:id])
        @approval = expense.build_expense_approval
        @approval.user = current_user
        @approval.approval = 0
        @approval.comment = "却下時は理由を入力してください。"
        if @approval.save
            expense.applicant = true
            expense.save
            redirect_to expense_index_path
        end
    end

    def update
        @approval = ExpenseApproval.find(params[:id])
        @approval.comment = params[:expense_approval][:comment]
        @approval.approval = 2
        if @approval.save
            redirect_to expense_approval_index_path
        end
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
