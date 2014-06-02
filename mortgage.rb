# require_relative 'calculator'
require 'pry'

class Mortgage

  def initialize(home_value, down_payment_percentage, apr, duration_in_years)
    @home_value = home_value.to_f
    @down_payment_percentage = down_payment_percentage
    @apr = apr.to_f
    @duration_in_years = duration_in_years.to_f
  end

  def down_payment
    @home_value * @down_payment_percentage
  end

  def monthly_rate
    @monthly_rate = (@apr / 12) / 100
  end

  def num_payments
    @num_payments = @duration_in_years * 12
  end

  def monthly_payment
    numerator = ((@home_value - down_payment)* monthly_rate) * ((1 + monthly_rate)**num_payments)
    denominator = ((1 + monthly_rate)**num_payments) - 1
    (numerator / denominator)
  end

  def total_interest_paid
    (monthly_payment * num_payments) - (@home_value - down_payment)
  end

end

