class CashRegister
    attr_accessor :total, :discount, :my_items, :last_transaction

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @my_items = []
    end

    def add_item(title, price, quantity = 1)
        @total += (price * quantity)
        
        quantity.times do 
            @my_items << title
        end

        @last_transaction = (price*quantity)
    end

    def apply_discount
        if discount > 0
            @discount = @discount/100.to_f
            @total -= (@discount*@total)
            @total = @total.to_i
            return "After the discount, the total comes to $#{@total}."
        else
            return "There is no discount to apply."
        end
    end

    def items
        @my_items
    end

    def void_last_transaction
        @total -= @last_transaction
    end

end

