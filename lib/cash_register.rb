require 'pry'

class CashRegister
    attr_accessor :total, :items, :discount, :last_transaction

    def initialize(discount=nil)
        @total = 0
        @discount = discount
        @items = []
    end
    
    def add_item(item, price, quantity=1)
       self.total += (price * quantity) 
       quantity.times { items << item }
       self.last_transaction = (price * quantity)
    end

    def apply_discount
        if discount 
            self.total -= (total * (discount.to_f / 100)).to_i 
            "After the discount, the total comes to $#{self.total}."
        else 
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total -= self.last_transaction
    end
end