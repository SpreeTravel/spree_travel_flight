require 'spec_helper'

describe Spree::CalculatorFlight do

  before :each do
    DatabaseCleaner.strategy = example.metadata[:js] ? :truncation : :transaction
    DatabaseCleaner.start
  end

  it 'displays the right price' do
    prod = create(:travel_product, product_type: Spree::ProductType.first)
    expect(prod.product_type.name).to eq('flight')
    prod.generate_variants
    variant = prod.variants.first
    origin = create(:destination)
    destination = create(:destination)

    rate = create(:rate_flight, variant: variant, origin: origin, destination: destination)
    line_item = create(:line_item, quantity: 0, product: prod, variant: variant)
    context = create(:travel_context, line_item: line_item, variant: variant, origin: origin, destination: destination)

    calculator_class = ("Spree::CalculatorFlight").constantize

    prices = calculator_class.calculate_price(context, variant).sort
    expect(prices.count).to eq(1)
  end
end