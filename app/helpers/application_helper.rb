module ApplicationHelper

  def display_price(price)
    number_with_precision(price, precision: 2, separator: '.', delimiter: "'")
  end

end
