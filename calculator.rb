require_relative 'mortgage'
require 'pry'

DOWN_PAYMENT_PERCENTAGES = [0.05, 0.10, 0.15, 0.20]

print "What is the home value: "
home_value = gets.chomp.to_f

print "What is the APR: "
apr = gets.chomp.to_f

print "What is the duration (in years): "
duration_in_years = gets.chomp.to_f

puts
puts sprintf("%-15s %-10s %-10s %-20s %-20s",
  "Down Payment", "Duration", "APR", "Monthly Payment", "Total Interest Paid")

DOWN_PAYMENT_PERCENTAGES.each do |down_payment_percentage|
  mortgage = Mortgage.new(home_value, down_payment_percentage, apr, duration_in_years)
  # binding.pry

  puts sprintf("%-15.2f %-10d %-10.3f %-20.2f %-20.2f",
    mortgage.down_payment, duration_in_years, apr,
    mortgage.monthly_payment, mortgage.total_interest_paid)
end
