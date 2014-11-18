require 'spec_helper'
require 'rake'

describe 'Rake task spree_travel_flight:load' do
  before { Dummy::Application.load_tasks }

  it 'does not raise error' do
    expect { Rake::Task['spree_travel_flight:load'].invoke }.not_to raise_exception
  end

  context 'it inserts the corect values' do

    before :each do
      Rake::Task['spree_travel_flight:load'].invoke
    end

    # it 'associates correctly to product_type spree_travel_flight' do
    #   expect(Spree::TravelCalculator.where(:name => 'Spree::CalculatorFlight').product_type.name).to be_equal('flight')
    # end

    it 'inserts all the option types' do
      expect(Spree::OptionType.where(:name => 'start_date').count).to be_equal(1)
      expect(Spree::OptionType.where(:name => 'end_date').count).to be_equal(1)
      expect(Spree::OptionType.where(:name => 'travel_class').count).to be_equal(1)
      expect(Spree::OptionType.where(:name => 'travel_module').count).to be_equal(1)
    end
  end
end