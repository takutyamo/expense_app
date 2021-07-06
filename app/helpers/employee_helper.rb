module EmployeeHelper
    def admin(admin)
        if admin
            "管理者"
        else
            "申請者"
        end
    end  
end
