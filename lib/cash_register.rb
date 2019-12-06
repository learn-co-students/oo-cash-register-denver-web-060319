require 'pry'
class CashRegister
    attr_accessor :total
    attr_reader :discount

    def initialize(discount=nil)
        @total = 0
        @discount = discount
        @items = []
        # if discount 
        #     @total = self.discount(discount)
        # end
    end
        

    # def discount
    #     @total = @total - (@total * (@discount / 100))
    # end

    def add_item(item, price, quantity=nil)
        if quantity  
            @price = price * quantity
            @total += (price * quantity) 
            quantity.times { @items << item}
        else 
            @price = price
            @total += price
            @items << item
        end
    end

    def apply_discount
        if @discount 
            @total -= (@total * (@discount.to_f / 100)).to_i 
            "After the discount, the total comes to $#{@total}."
        else 
            "There is no discount to apply."
        end
    end

    def items
        @items
    end

    def void_last_transaction
        @total -= @price 
        # @items.pop
        # if @items.length == 0
        #     @total = 0.0
        # end
    end
end