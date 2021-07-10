module ExpensesHelper
    #勘定科目名設定
    def rename(ha)
        eh = {}
        ea = ["事務用品費","雑費","交通費","接待交際費"]
        ea.each_with_index do |e,i|
            eh.merge!(e => (ha[i+1] != nil ? ha[i+1] : 0))
        end
        eh
    end

    def company_has_approval(user)
        ExpenseApproval.where(expense: Expense.where(user: User.where(company: user.company)))
    end

    def sum(item)
        sitemeach { |n| sum += (item.integer? ? sum += n : sum += 0 ) }
    end

    def compression(title)
        title.length >= 10 ? title.scan(/.{1,#{8}}/).first + "..." : title
    end
end
