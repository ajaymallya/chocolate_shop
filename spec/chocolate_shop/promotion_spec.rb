require 'spec_helper'

RSpec.describe ChocolateShop::Promotion do
  let(:milk_promos)       { described_class.new(:milk).find_promotions }
  let(:white_promos)      { described_class.new(:white).find_promotions }
  let(:sugar_free_promos) { described_class.new(:sugar_free).find_promotions }
  let(:dark_promos)       { described_class.new(:dark).find_promotions }

  it 'expect milk chocolate promotions to be one milk and one sugar free' do
    expect(milk_promos).to match_array [:milk, :sugar_free]
  end

  it 'expect white chocolate promotions to be one white and one sugar free' do
    expect(white_promos).to match_array [:white, :sugar_free]
  end

  it 'expect sugar free promotions to be one sugar free and one dark' do
    expect(sugar_free_promos).to match_array [:sugar_free, :dark]
  end

  it 'expect dark promotions to be one dark' do
    expect(dark_promos).to match_array [:dark]
  end
end
