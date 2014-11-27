FactoryGirl.define do
  factory :rate_flight, class: Spree::Rate do
    ignore do
      origin ""
      destination ""
      start_date Date.today - (365 / 2)
      end_date Date.today + (365 / 2)
      one_child '10'
      one_adult '100'
    end
    association :variant, factory: :variant_decorated
    after(:create) { |rate, evaluator|
      rate.set_option_value(:start_date, evaluator.start_date)
      rate.set_option_value(:end_date, evaluator.end_date)
      rate.set_option_value(:one_child, evaluator.one_child)
      rate.set_option_value(:one_adult, evaluator.one_adult)
      rate.set_option_value(:origin, evaluator.origin)
      rate.set_option_value(:destination, evaluator.destination)
      rate.save
    }
  end
end