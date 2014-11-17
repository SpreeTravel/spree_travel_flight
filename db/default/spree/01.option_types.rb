### This is the data
option_types = [
  {:name => "start_date", :presentation => "Start Date", :attr_type => 'date'},
  {:name => "end_date", :presentation => "End Date", :attr_type => 'date'},
  {:name => "departure_date", :presentation => "Departure Date", :attr_type => 'date'},
  {:name => "arrival_date", :presentation => "Arrival Date", :attr_type => 'date'},
  {:name => "travel_class", :presentation => "Class", :attr_type => 'selection'},
  {:name => "travel_class", :presentation => "Class", :attr_type => 'selection'},
  {:name => "adult", :presentation => "Adult", :attr_type => 'integer'},
  {:name => "child", :presentation => "Child", :attr_type => 'integer'},
  {:name => "one_adult", :presentation => "one_adult", :attr_type => 'float'},
  {:name => "one_child", :presentation => "one_child", :attr_type => 'float'},
  {:name => "travel_module", :presentation => "Travel Module", :attr_type => 'selection'}
]

### Creating Option Types
option_types.each do |ot|
  Spree::OptionType.where(:name => ot[:name]).first_or_create(:presentation => ot[:presentation], :attr_type => ot[:attr_type])
end
