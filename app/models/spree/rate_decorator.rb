module Spree
  Rate.class_eval do

    def one_child
      get_option_value(:one_child)
    end

    def one_adult
      get_option_value(:one_adult)
    end

    def origin
      get_option_value(:origin)
    end

    def destination
      get_option_value(:destination)
    end

  end
end