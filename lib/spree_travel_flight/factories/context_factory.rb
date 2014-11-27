FactoryGirl.define do

  factory :travel_context, class: Spree::Context do
    ignore do
      origin ""
      destination ""
      variant ""
    end
    line_item
    after(:create) { |context, evaluator|
      context_params = {}
      context_params['product_type'] = 'flight'
      context_params['start_date'] = Date.today
      context_params['end_date'] = Date.today
      context_params['travel_class'] = evaluator.variant.option_values.first.presentation
      context_params['adult'] = 1
      context_params['child'] = 1
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
