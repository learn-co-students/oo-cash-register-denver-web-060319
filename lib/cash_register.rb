require 'pry'

class CashRegister

  attr_accessor :total, :last_price
  attr_reader :discount, :items

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @last_price = 0
  end

  def add_item(item, price, quantity = 1)
    self.last_price = price * quantity
    self.total += self.last_price
    quantity.times do
      self.items << item
    end
  end

  def apply_discount
    if self.discount > 0
      self.total = self.total * (1 - (self.discount / 100.0))
      "After the discount, the total comes to $#{self.total.round}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    self.total -= self.last_price
  end
end