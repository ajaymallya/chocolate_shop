require 'spec_helper'

RSpec.describe ChocolateShop::Basket do
  context 'Empty basket' do
    let(:basket) { described_class.new }

    it 'should be empty' do
      %i(milk dark white sugar_free).each do |type|
        expect(basket.get(type)).to eq 0
      end
    end
  end

  context 'setting and getting' do
    let(:basket) { described_class.new }
    before { basket.set(:milk, 5) }

    it 'expect the basket to have 5 milk chocolates' do
      expect(basket.get(:milk)).to eq 5
    end

    it 'expect the basket to not have other types of chocolates' do
      %i(dark white sugar_free).each do |type|
        expect(basket.get(type)).to eq 0
      end
    end
  end

  context '#increment' do
    let(:basket) { described_class.new }
    before { basket.set(:dark, 4) }
    let(:perform) { basket.increment(:dark) }

    it 'should change the quantity of dark chocolates to 5' do
      expect { perform }.to change { basket.get(:dark) }.from(4).to(5)
    end

    it 'should not change the quantity of other types of chocolates' do
      %i(white milk sugar_free).each do |type|
        expect { perform }.to_not change { basket.get(:type) }
      end
    end 
  end

  context 'reset basket' do
    let(:basket) { described_class.new }
    before do
      basket.set(:dark, 4)
      basket.reset_all!
    end

    it 'resets quantities of all types of chocolates to zero' do
      %i(white milk sugar_free dark).each do |type|
        expect(basket.get(type)).to eq 0
      end
    end
  end

  context "#to_s" do
    let(:basket) { described_class.new }
    before do
      basket.set(:dark, 4)
      basket.set(:milk, 5)
    end

    it 'returns the expected string' do
      expect(basket.contents). to eq "milk 5, dark 4, white 0, sugar free 0"
    end
  end
end
