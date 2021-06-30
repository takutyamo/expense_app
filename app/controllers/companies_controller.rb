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

    private 
    def company_params
        params.require(:company).permit(:name,:address,:email)
    end


end
