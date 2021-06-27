module ExpensesHelper
    def rename(ha)
        eh = {}
        ea = ["事務用品費","雑費","交通費","接待交際費"]
        ea.each_with_index do |e,i|
            eh.merge!(e => (ha[i+1] != nil ? ha[i+1] : 0))
        end
        eh
    end
end
