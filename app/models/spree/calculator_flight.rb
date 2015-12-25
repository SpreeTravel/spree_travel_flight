module Spree
  class CalculatorFlight

    def self.calculate_price(context, variant, options)
      return [] if variant.rates.empty?
      prices = []
      #days = context.end_date(options).to_date - context.start_date(options).to_date rescue 1

      variant.rates.each do |r|
        #next if context.departure_date.present? && (context.departure_date.to_date < r.start_date.to_date rescue false)
        #next if context.departure_date.present? && (context.departure_date.to_date > r.end_date.to_date rescue false)
        #next if context.origin.present? && (context.origin.presentation == r.origin.presentation rescue false)
        #next if context.destination.present? && (context.destination.presentation == r.destination.presentation rescue false)
        #adults_array = self.get_adult_list(r, context.adult)
        #children_array = self.get_child_list(r, context.child)
        #combinations = adults_array.product(children_array)
        #combinations.each do |ad, ch|
        #  prices << self.get_rate_price(r, ad, ch)
        #end
        next if (context.departure_date.to_date != r.start_date.to_date rescue false)
        prices << r
      end
      prices
    end

    private

    def self.get_adult_list(rate, pt_adults)
      if pt_adults.present?
        [pt_adults]
      else
        [1]
      end
    end

    def self.get_child_list(rate, pt_child)
      if pt_child.present?
        [pt_child]
      else
        [0]
      end
    end

    def self.get_rate_price(rate, adults, children)
      adults = adults.to_i
      children = children.to_i
      price = adults * rate.one_adult.to_i + children * rate.one_child.to_i
      price
    end

  end
end
