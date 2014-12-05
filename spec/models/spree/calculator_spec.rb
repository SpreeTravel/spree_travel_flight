require 'spec_helper'

describe Spree::CalculatorFlight do

  before :each do
    DatabaseCleaner.strategy = example.metadata[:js] ? :truncation : :transaction
    DatabaseCleaner.start
  end

  context 'displays the right price' do

    it 'passing all the correct attributes' do
      prod = create(:travel_product, product_type: Spree::ProductType.first)
      prod.generate_variants
      variant = prod.variants.first
      origin = create(:destination)
      destination = create(:destination)

      rate = create(:rate_flight, variant: variant, origin: origin, destination: destination)
      line_item = create(:line_item, quantity: 0, product: prod, variant: variant)
      context = create(:travel_context, line_item: line_item, variant: variant, origin: origin, destination: destination)

      calculator_class = ("Spree::CalculatorFlight").constantize

      prices = calculator_class.calculate_price(context, variant).sort
      expect(prices.first).to eq(110)
    end

    it 'with some attributes missing' do
      prod = create(:travel_product, product_type: Spree::ProductType.first)
      prod.generate_variants
      variant = prod.variants.first
      origin = create(:destination)
      destination = create(:destination)

      rate = create(:rate_flight, variant: variant, origin: origin, destination: destination)
      line_item = create(:line_item, quantity: 0, product: prod, variant: variant)
      context = create(:travel_context, line_item: line_item, variant: variant, origin: origin, destination: destination, adults: nil, childs: nil)

      calculator_class = ("Spree::CalculatorFlight").constantize

      prices = calculator_class.calculate_price(context, variant).sort
      expect(prices.first).to eq(100)
    end
  end
end