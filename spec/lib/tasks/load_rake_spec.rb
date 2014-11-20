require 'spec_helper'
require 'rake'

describe 'Rake task spree_travel_flight:load' do
  before { Dummy::Application.load_tasks }

  it 'does not raise error' do
    expect { Rake::Task['spree_travel_flight:load'].invoke }.not_to raise_exception
  end

  context 'inserts correctly' do
    before { Dummy::Application.load_tasks }
    it 'associates correctly to product_type spree_travel_flight' do
      expect(Spree::TravelCalculator.where(:name => 'Spree::CalculatorFlight').first.product_type.name).to eq('flight')
    end

    it 'the option types' do
      Rake::Task['spree_travel_flight:load'].invoke
      expect(Spree::OptionType.where(:name => 'start_date').count).to be_equal(1)
      expect(Spree::OptionType.where(:name => 'end_date').count).to be_equal(1)
      expect(Spree::OptionType.where(:name => 'travel_class').count).to be_equal(1)
      expect(Spree::OptionType.where(:name => 'departure_date').count).to be_equal(1)
      expect(Spree::OptionType.where(:name => 'adult').count).to be_equal(1)
      expect(Spree::OptionType.where(:name => 'child').count).to be_equal(1)
      expect(Spree::OptionType.where(:name => 'one_child').count).to be_equal(1)
    end
  end
end