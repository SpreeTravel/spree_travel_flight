module Spree
  Context.class_eval do
    def departure_date
      get_temporal_option_value(:departure_date)
    end

    def origin
      get_temporal_option_value(:origin)
    end

    def destination
      get_temporal_option_value(:destination)
    end

  end
end