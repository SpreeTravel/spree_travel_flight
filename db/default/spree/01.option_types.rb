### This is the data
option_types = [
  {:name => "departure_date", :presentation => "Departure Date", :attr_type => 'date'},
  {:name => "arrival_date", :presentation => "Arrival Date", :attr_type => 'date'},
  {:name => "travel_class", :presentation => "Class", :attr_type => 'selection'}
]

### Creating Option Types
option_types.each do |ot|
  Spree::OptionType.where(:name => ot[:name]).first_or_create(:presentation => ot[:presentation], :attr_type => ot[:attr_type])
end
