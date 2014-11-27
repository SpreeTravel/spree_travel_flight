FactoryGirl.define do

  factory :travel_context, class: Spree::Context do
    ignore do
      origin ""
      destination ""
      variant ""
      adults 1
      childs 1
      departure_date Date.today
    end
    line_item
    after(:create) { |context, evaluator|
      context_params = {}
      context_params['product_type'] = 'flight'
      context_params['departure_date'] = evaluator.departure_date
      context_params['travel_class'] = evaluator.variant.option_values.first.presentation
      context_params['adult'] = evaluator.adults
      context_params['child'] = evaluator.childs
      context_params['origin'] = evaluator.origin
      context_params['destination'] = evaluator.destination
      context.initialize_variables
      context.set_option_values(context_params, :temporal => true)
    }
  end

  factory :context_option_value, class: Spree::ContextOptionValue do
    association :option_value, factory: :option_value_decorated
    association :context, factory: :travel_context
  end

end
