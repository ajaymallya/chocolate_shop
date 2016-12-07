# This class is used to represent an order
# and perform trades.

module ChocolateShop
  class Order
    attr_reader :cash, :price, :wrappers_needed, :type

    def initialize(order)
      @cash = order['cash'].to_i
      @price = order['price'].to_i
      @wrappers_needed = order['wrappers needed'].to_i
      @type = clean(order['type'])
    end

    def perform_trades(basket)
      wrappers = max_purchasable_with_cash
      basket.set(type, wrappers)
      trade_chocolates(type, wrappers, basket)

      remaining_chocolate_types.each do |t|
        wrappers = basket.get(t)
        trade_chocolates(t, wrappers, basket)
      end
    end

    private

    def remaining_chocolate_types
      ALL_CHOCOLATE_TYPES - [type]
    end

    def max_purchasable_with_cash
      cash / price
    end

    def clean(order_type)
      order_type.
        tr("'", "").
        tr(" ", "_").
        to_sym
    end

    def trade_chocolates(type, wrappers, basket)
      while(wrappers >= wrappers_needed) do
        wrappers -= wrappers_needed
        promos = Promotion.new(type).find_promotions
        promos.each do |p|
          basket.increment(p)
          wrappers += 1 if p == type
        end
      end
    end
  end
end
