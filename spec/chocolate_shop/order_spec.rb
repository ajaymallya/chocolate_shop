require 'spec_helper'
require 'pry'

RSpec.describe ChocolateShop::Order do
  let(:row) do
    {
      "cash"  => cash,
      "price" => price,
      "wrappers needed" => wrappers_needed,
      "type" => type
    }
  end

  let(:order)           { described_class.new(row) }
  let(:basket)          { ChocolateShop::Basket.new }
  let(:perform)         { order.perform_trades(basket) }
  before { perform }

  context 'Order 1' do
    let(:cash)            { 12 }
    let(:price)           { 2 }
    let(:wrappers_needed) { 5 }
    let(:type)            { "'milk'" }
    let(:expected_result) { "milk 7, dark 0, white 0, sugar free 1" }

    it { expect(basket.contents).to eq expected_result }
  end

  context 'Order 2' do
    let(:cash)            { 12 }
    let(:price)           { 4 }
    let(:wrappers_needed) { 4 }
    let(:type)            { "'dark'" }
    let(:expected_result) { "milk 0, dark 3, white 0, sugar free 0" }

    it { expect(basket.contents).to eq expected_result }
  end

  context 'Order 3' do
    let(:cash)            { 6 }
    let(:price)           { 2 }
    let(:wrappers_needed) { 2 }
    let(:type)            { "'sugar free'" }
    let(:expected_result) { "milk 0, dark 3, white 0, sugar free 5" }

    it { expect(basket.contents).to eq expected_result }
  end

  context 'Order 4' do
    let(:cash)            { 6 }
    let(:price)           { 2 }
    let(:wrappers_needed) { 2 }
    let(:type)            { "'white'" }
    let(:expected_result) { "milk 0, dark 1, white 5, sugar free 3" }

    it { expect(basket.contents).to eq expected_result }
  end
end
