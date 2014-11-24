require 'spec_helper'

describe Spree::CalculatorFlight do
  it 'displays the right price' do
    prod = create(:travel_product, product_type: Spree::ProductType.first)
    expect(prod.product_type.name).to eq('flight')
    prod.generate_variants
    rate = create(:rate_flight, variant: prod.variants.first)
    start_date = "2014-01-01".to_date
    end_date = "2015-01-01".to_date
    rate.set_option_value(:start_date, start_date)
    rate.set_option_value(:end_date, end_date)
    rate.set_option_value(:one_child, '10')
    rate.set_option_value(:one_adult, '100')
    rate.set_option_value(:origin, create(:destination))
    rate.set_option_value(:destination, create(:destination))
    rate.save
  end
end