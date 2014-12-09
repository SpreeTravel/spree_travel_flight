### This is the data
#El agregado en los precios de los vuelos es la reserva con n dias de antelacion
#se puede ir viendo una manera de hacerlo nombrando propiedades de modo x_days_plus
#y se le suma haciendo un juego con la fecha
# Con el tema de los modulos de viaje, la idea es que se compran dos viajes, y son dos
# productos distintos, creo que con package se hace esto bastante bien
option_types = [
  {:name => "start_date", :presentation => "Start Date", :attr_type => 'date', :short => 'Start'},
  {:name => "end_date", :presentation => "End Date", :attr_type => 'date', :short => 'End'},
  {:name => "adult", :presentation => "Adult", :attr_type => 'integer', :short => 'Adult'},
  {:name => "child", :presentation => "Child", :attr_type => 'integer', :short => 'Child'},
  {:name => "one_child", :presentation => "One Child", :attr_type => 'float', :short => 'Child'},
  {:name => "one_adult", :presentation => "One Adult", :attr_type => 'float', :short => 'Adult'},
  {:name => "departure_date", :presentation => "Departure Date", :attr_type => 'date', :short => 'Depart'},
  {:name => "return_date", :presentation => "Return Date", :attr_type => 'date', :short => 'Return'},
  {:name => "travel_class", :presentation => "Class", :attr_type => 'selection', :short => 'Class'},
  {:name => "travel_module", :presentation => "Travel Module", :attr_type => 'selection', :short => 'Mod'},
  {:name => "origin", :presentation => "Origin", :attr_type => 'destination', :short => 'Orig'},
  {:name => "destination", :presentation => "Destination", :attr_type => 'destination', :short => 'Dest'},
]

### Creating Option Types
option_types.each do |ot|
  Spree::OptionType.where(:name => ot[:name]).first_or_create(:presentation => ot[:presentation], :attr_type => ot[:attr_type])
end
