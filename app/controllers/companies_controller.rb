class CompaniesController < ApplicationController
    def new
        @company = Company.new
    end

    def create
        @company = Company.new(company_params)
        if @company.save
            @user = @company.users.build(first_name:@company.name, last_name:"管理者", email:@company.email, admin:true,password:"hogehoge")
            @user.save
            redirect_to '/'
        end
    end

    def employee_new
        @company = Company.find(current_user.company.id)
        @user = @company.users.build
    end

    def employee_create
        @company = Company.find(current_user.company.id)
        @user = @company.users.build(employee_params)
        @user.password = 'hogehoge'
        if @user.save
            redirect_to '/employee/new'
        end
    end

    private 
    def company_params
        params.require(:company).permit(:name,:address,:email)
    end

    def employee_params
        params.require(:user).permit(:first_name,:last_name,:email)
    end
end
