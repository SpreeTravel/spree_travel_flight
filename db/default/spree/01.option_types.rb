### This is the data
#El agregado en los precios de los vuelos es la reserva con n dias de antelacion
#se puede ir viendo una manera de hacerlo nombrando propiedades de modo x_days_plus
#y se le suma haciendo un juego con la fecha
# Con el tema de los modulos de viaje, la idea es que se compran dos viajes, y son dos
# productos distintos, creo que con package se hace esto bastante bien
option_types = [
  {:name => "start_date", :presentation => "Start Date", :attr_type => 'date'},
  {:name => "end_date", :presentation => "End Date", :attr_type => 'date'},
  {:name => "adult", :presentation => "Adult", :attr_type => 'integer'},
  {:name => "child", :presentation => "Child", :attr_type => 'integer'},
  {:name => "one_child", :presentation => "One Child", :attr_type => 'float'},
  {:name => "one_adult", :presentation => "One Adult", :attr_type => 'float'},
  {:name => "departure_date", :presentation => "Departure Date", :attr_type => 'date'},
  {:name => "return_date", :presentation => "Departure Date", :attr_type => 'date'},
  {:name => "travel_class", :presentation => "Class", :attr_type => 'selection'},
  {:name => "travel_module", :presentation => "Travel Module", :attr_type => 'selection'},
  {:name => "origin", :presentation => "Origin", :attr_type => 'destination'},
  {:name => "destination", :presentation => "Destination", :attr_type => 'destination'}
]

### Creating Option Types
option_types.each do |ot|
  Spree::OptionType.where(:name => ot[:name]).first_or_create(:presentation => ot[:presentation], :attr_type => ot[:attr_type])
end
