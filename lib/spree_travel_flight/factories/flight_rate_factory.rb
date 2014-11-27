FactoryGirl.define do
  factory :rate_flight, class: Spree::Rate do
    ignore do
      origin ""
      destination ""
    end
    association :variant, factory: :variant_decorated
    after(:create) { |rate, evaluator|
      start_date = Date.today - (365 / 2)
      end_date = Date.today + (365 / 2)
      rate.set_option_value(:start_date, start_date)
      rate.set_option_value(:end_date, end_date)
      rate.set_option_value(:one_child, '10')
      rate.set_option_value(:one_adult, '100')
      rate.set_option_value(:origin, evaluator.origin)
      rate.set_option_value(:destination, evaluator.destination)
      rate.save
    }
  end
end