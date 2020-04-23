require 'pry'
class CashRegister
    attr_accessor :total, :discount, :title, :amount
    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @title = []
    end
    def add_item(item, cash, quantity = 1)
        @cash = cash*quantity
        @total += cash*quantity
        if(quantity > 1) 
            count = 0
            while(count < quantity)
                @title << item
                count += 1
            end 
        else
            @title << item
        end 
        @amount = @total
    end
    def apply_discount
        if @discount > 0
            discount = @discount/100.to_f
            @total =  @total*(1 - discount)
            #binding.pry
            return "After the discount, the total comes to $#{@total.to_i}."
        else 
            return "There is no discount to apply."
        end 
    end 
    def items 
        @title 
    end 
    def void_last_transaction
        @total -= @cash
    end 
end 