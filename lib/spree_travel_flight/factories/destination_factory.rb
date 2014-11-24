FactoryGirl.define do
  factory :destination_taxonomy, class: Spree::Taxonomy do
    name 'Destination'
  end

  factory :destination, class: Spree::Taxon do
    sequence(:name) { |n| "destination_##{n}" }
    association :taxonomy, factory: :destination_taxonomy
    parent_id nil
  end

end
