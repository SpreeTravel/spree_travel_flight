module Spree
  class CalculatorFlight

    def self.calculate_price(context, product)
      return [product.price.to_f] if product.rates.empty?
      prices = []
      days = context.end_date.to_date - context.start_date.to_date rescue 1

      product.rates.each do |r|
        next if context.start_date.present? && (context.start_date.to_date < r.departure_date.to_date rescue false)
        next if context.end_date.present? && (context.end_date.to_date > r.departure_date.to_date rescue false)
        adults_array = self.get_adult_list(r, context.adult)
        children_array = self.get_child_list(r, context.child)
        combinations = adults_array.product(children_array)
        combinations.each do |ad, ch|
          prices << self.get_rate_price(r, ad, ch)
        end
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
      price = adults * rate.one_adult + children * rate.one_child
      price
    end

  end
end
