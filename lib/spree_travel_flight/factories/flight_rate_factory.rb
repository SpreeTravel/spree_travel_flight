FactoryGirl.define do
  factory :rate_flight, class: Spree::Rate do
    association :variant, factory: :variant_decorated
  end
end