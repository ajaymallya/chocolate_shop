require 'spec_helper'

RSpec.describe ChocolateShop::Shop do
  let(:shop) { described_class.new }

  context 'Before starting up' do
    it 'has empty results' do
      expect(shop.results.count).to eq 0
    end
  end

  context '#run' do
    let(:output_file) { 'output/redemptions.csv' }
    before do
      File.delete(output_file)
      shop.run
    end

    it 'has the results for the four orders' do
      expect(shop.results.count).to eq 4
    end

    it 'creates the output file' do
      expect(File.exist?(output_file)).to be true
    end
  end
end
