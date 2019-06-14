require "pry"

class CashRegister

  attr_reader :name, :discount
  attr_accessor :total, :items, :last_transaction

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity = 1)
    @total += price * quantity
    while quantity > 0 do
      @items << title
      quantity -= 1
    end
    @last_transaction = {title => price}
  end

  def apply_discount
    if discount != 0
      @total = (@total * ((100 - @discount)/100.0)).to_i
      "After the discount, the total comes to $#{@total}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    @total -= @last_transaction[@items.last]
  end

end
