class EmployeeController < ApplicationController
    def index
        @employee = User.where(company: current_user.company)
    end

    def new
        @company = Company.find(current_user.company.id)
        @user = @company.users.build
    end

    def create
        @company = Company.find(current_user.company.id)
        @user = @company.users.build(employee_params)
        @user.password = 'hogehoge'
        if @user.save
            redirect_to '/employee/new'
        end
    end

    private
    def employee_params
        params.require(:user).permit(:first_name,:last_name,:email)
    end
end
