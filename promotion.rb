# This class is used to determine promotions
# for a given type of chocolate

module ChocolateShop
  class Promotion
    attr_reader :type

    PROMOTIONS = {
      milk: [:milk, :sugar_free],
      white: [:white, :sugar_free],
      sugar_free: [:sugar_free, :dark],
      dark: [:dark]
    }

    def initialize(type)
      @type = type
    end

    def find_promotions
      PROMOTIONS[type]
    end
  end
end
