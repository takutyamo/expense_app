class EmployeeController < ApplicationController
    before_action :require_login

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

        def require_login
            unless current_user
                redirect_to new_user_session_path
            end
        end
end
