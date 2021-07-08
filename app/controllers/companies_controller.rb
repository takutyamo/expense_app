class CompaniesController < ApplicationController
    def new
        @company = Company.new
    end

    def create
        @company = Company.new(name: company_params[:name], address: company_params[:address],email:company_params[:email])
        if @company.save
            @user = @company.users.build(first_name: company_params.permit[:first_name], last_name: company_params.permit[:last_name], email: company_params.permit[:password], admin:true,password:"hogehoge")
            if @user.save
                redirect_to '/'
            end
        end
    end

    private 
    def company_params
        params.require(:company).permit(:name,:address,:email,:first_name,:last_name,:password)
    end


end
