FactoryGirl.define do

  factory :travel_context, class: Spree::Context do
    line_item
  end

  factory :context_option_value, class: Spree::ContextOptionValue do
    association :option_value, factory: :option_value_decorated
    association :context, factory: :travel_context
  end

end
