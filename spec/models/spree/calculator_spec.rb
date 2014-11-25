require 'spec_helper'

describe Spree::CalculatorFlight do

  # before :each do
  #   DatabaseCleaner.strategy = example.metadata[:js] ? :truncation : :transaction
  #   DatabaseCleaner.start
  # end

  it 'displays the right price' do
    prod = create(:travel_product, product_type: Spree::ProductType.first)
    expect(prod.product_type.name).to eq('flight')
    prod.generate_variants
    variant = prod.variants.first
    rate = create(:rate_flight, variant: variant)
    start_date = Date.today - (365 / 2)
    end_date = Date.today + (365 / 2)
    rate.set_option_value(:start_date, start_date)
    rate.set_option_value(:end_date, end_date)
    rate.set_option_value(:one_child, '10')
    rate.set_option_value(:one_adult, '100')
    origin = create(:destination)
    rate.set_option_value(:origin, origin)
    destination = create(:destination)
    rate.set_option_value(:destination, destination)
    rate.save
    line_item = create(:line_item, quantity: 0, product: prod, variant: variant)
    context = create(:travel_context, line_item: line_item)

    create(:context_option_value, context: context, option_value: create(:option_value_decorated, name: "start_date", presentation: Date.today, option_type: Spree::OptionType.where(name: "start_date").first))

    create(:context_option_value, context: context, option_value: create(:option_value_decorated, name: "end_date", presentation: Date.today, option_type: Spree::OptionType.where(name: "end_date").first))

    create(:context_option_value, context: context, option_value: create(:option_value_decorated, name: "travel_class", presentation: variant.option_values.first.presentation, option_type: Spree::OptionType.where(name: "travel_class").first))

    create(:context_option_value, context: context, option_value: create(:option_value_decorated, name: "adult", presentation: 1, option_type: Spree::OptionType.where(name: "adult").first))

    create(:context_option_value, context: context, option_value: create(:option_value_decorated, name: "adult", presentation: 1, option_type: Spree::OptionType.where(name: "child").first))

    create(:context_option_value, context: context, option_value: create(:option_value_decorated, name: "origin", presentation: origin.name, option_type: Spree::OptionType.where(name: "origin").first))

    create(:context_option_value, context: context, option_value: create(:option_value_decorated, name: "destination", presentation: destination.name, option_type: Spree::OptionType.where(name: "destination").first))

    calculator_class = ("Spree::CalculatorFlight").constantize

    prices = calculator_class.calculate_price(context, variant).sort
    expect(prices.count).to eq(1)
  end
end