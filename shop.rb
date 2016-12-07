require 'csv'
require_relative 'basket'
require_relative 'promotion'
require_relative 'order'

# This class is the entry point to the code.

module ChocolateShop
  ALL_CHOCOLATE_TYPES = %i(milk dark sugar_free white)

  class Shop
    attr_reader :results, :basket

    def initialize
      @results = []
      @basket  = Basket.new
    end

    def run
      input.each do |row|
        order = Order.new(row)
        order.perform_trades(basket)
        results << basket.contents
        basket.reset_all!
      end

      output(results)
    end

    private

    def converter
      ->(h) { h.strip }
    end

    def output(strings)
      File.open(output_file, 'w') do |file|
        strings.each { |s| file.puts(s) }
      end
    end

    def input
      CSV.read(
        input_file,
        headers: true,
        skip_blanks: true,
        header_converters: converter,
        converters: converter
      )
    end

    def input_file
      'input/orders.csv'
    end

    def output_file
      'output/redemptions.csv'
    end
  end
end

ChocolateShop::Shop.new.run
