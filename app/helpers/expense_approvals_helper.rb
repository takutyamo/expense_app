module ExpenseApprovalsHelper
    def date_format(appdate)
        appdate.strftime('%Y年%m月%d日')
    end
end
