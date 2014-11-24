### These are the option types
travel_class = Spree::OptionType.find_by_name!("travel_class")
travel_module = Spree::OptionType.find_by_name!("travel_module")

### This is the data
option_values = [
  {:name => "bussiness", :presentation => "Executive Class", :option_type => travel_class},
  {:name => "economy", :presentation => "Economy Class", :option_type => travel_class},
  {:name => "first", :presentation => "First Class", :option_type => travel_class},
  {:name => "one_way", :presentation => "One Way", :option_type => travel_module},
  {:name => "round_trip", :presentation => "Round Trip", :option_type => travel_module}
]

### Creating Option Values
option_values.each do |ov|
  Spree::OptionValue.create!(ov)
end
