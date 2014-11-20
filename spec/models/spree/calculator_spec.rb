require 'spec_helper'

describe Spree::CalculatorFlight do
  it 'displays the right price' do
    prod = create(:travel_product, product_type: Spree::ProductType.first)
    expect(prod.product_type.name).to eq('flight')
  end
end