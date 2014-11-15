### These are the option types
room = Spree::OptionType.find_by_name!("travel_class")

### This is the data
option_values = [
  {:name => "bussiness", :presentation => "Executive Class", :option_type => travel_class},
  {:name => "economy", :presentation => "Economy Class", :option_type => travel_class},
  {:name => "first", :presentation => "First Class", :option_type => travel_class},
]

### Creating Option Values
option_values.each do |ov|
  Spree::OptionValue.create!(ov)
end
