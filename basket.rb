# This is a utility class used to help perform trades

module ChocolateShop
  class Basket
    attr_accessor :basket

    def initialize
      @basket = {}
      reset_all!
    end

    def set(type, number)
      basket[type] = number
    end

    def get(type)
      basket[type]
    end

    def increment(type)
      basket[type] += 1
    end

    def contents
      "milk #{milk}, dark #{dark}, white #{white}, sugar free #{sugar_free}"
    end

    def reset_all!
      ALL_CHOCOLATE_TYPES.each { |type| basket[type] = 0 }
    end

    private

    def milk
      basket[:milk]
    end

    def dark
      basket[:dark]
    end

    def white
      basket[:white]
    end

    def sugar_free
      basket[:sugar_free]
    end
  end
end
