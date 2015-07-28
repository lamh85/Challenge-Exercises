# HOW TO RUN THIS APP:
# Make sure that there is a CSV file in the same directory of this RB file.
# Name it "input.csv". Otherwise, make sure that this line of code calls the correct filename:
# CSV.foreach("input.csv") do |row|
# ###

require 'csv'

raw_data_hashed = []
csv_array = []

# Sanitize the array of rows. Otherwise, the CSV class method would create 2 array elements: content, and blank
CSV.foreach("input.csv") do |row|
  csv_array << row[0]
end

# Get the header names by parsing the first row of the CSV data
header_names = csv_array.first.to_s.split("|") 

# Remove the first row because it contains just header names, not data
csv_array.delete_at(0) 

# Build an array of hashes
row_counter = 0
csv_array.each do |row|

  csv_array[row_counter] = csv_array[row_counter].to_s.split("|")

  # Build a hash of key-value pairs
  hash = {}
  header_name_counter = 0
  header_names.each do |header_name|
    hash[header_name.to_sym] = csv_array[row_counter][header_name_counter]
    header_name_counter += 1
  end
  raw_data_hashed << hash

  row_counter += 1
end

# Find the number of unique customers
customer_ids = []
raw_data_hashed.each do |hash|
  customer_ids << hash[:CustID]
end

puts "1) There are #{customer_ids.uniq.length} unique customer IDs."

# Group customers by ElecOrGas
electric = []
gas = []
raw_data_hashed.each do |hash|
  if hash[:ElecOrGas].to_i == 1
    electric << hash[:CustID]
  elsif hash[:ElecOrGas].to_i == 2
    gas << hash[:CustID]
  end
end
both = electric & gas

# Remove customers that use both
electric = electric - both
gas = gas - both

puts ""
puts "2) Breakdown of sources of energy:"
puts "#{electric.uniq.length} customers only use Electric."
puts "#{gas.uniq.length} customers only use Gas."
puts "#{both.uniq.length} customer(s) use both Electric and Gas."

# Histogram of readings frequency - number of cusomters
# #####################################################

# Create a hash of customer-id/number of readings
customer_readings_hash = {}
customer_ids_unique = customer_ids.uniq
customer_ids_unique.each do |unique_id|
  readings = 0
  customer_ids.each do |id|
    if unique_id == id
      readings += 1
    end
  end
  customer_readings_hash[unique_id.to_i] = readings
end

# Create array of unique values: frequencies of readings
reading_frequencies = []
customer_readings_hash.each do |key,value|
  reading_frequencies << value
end
reading_frequencies.uniq!
reading_frequencies.sort!

# Initialize the final hash
readings_customers_hash = {}
reading_frequencies.each do |value|
  readings_customers_hash[value.to_i] = 0
end

# Increase each key based on customer number
readings_customers_hash.each do |reading_key, reading_value|
  customer_readings_hash.each do |key,value|
    if value == reading_key
      readings_customers_hash[reading_key] += 1
    end
  end
end

puts ""
puts "3) Here is a histogram of (Number of meter readings => Number of customers):"
puts readings_customers_hash

# Average consumption per month
# #############################

# Initialize arrays:
electric_averages = []
gas_averages = []
12.times do
  electric_averages << []
  gas_averages << []
end

# Push consumption readings to correct array
raw_data_hashed.each do |row|
  row_month = row[:"Meter Read Date"][4..5].to_s
  if row_month[0] == "0"
    row_month = row_month[1]
    row_month = row_month.to_i
  end

  if row[:ElecOrGas].to_i == 1
    electric_averages[row_month.to_i-1] << row[:Consumption].to_f
  elsif row[:ElecOrGas].to_i == 2
    gas_averages[row_month.to_i-1] << row[:Consumption].to_f
  end
end

def calculate_averages(array_input)
  month_counter = 0
  array_input.each do |month|
    readings_sum = 0
    month.each do |reading|
      readings_sum += reading
    end
    array_input[month_counter] = readings_sum/(month.length)
    month_counter += 1
  end
end

calculate_averages(electric_averages)
calculate_averages(gas_averages)

def print_averages(array_input)
  puts "January: #{array_input[0]}"
  puts "February: #{array_input[1]}"
  puts "March: #{array_input[2]}"
  puts "April: #{array_input[3]}"
  puts "May: #{array_input[4]}"
  puts "June: #{array_input[5]}"
  puts "July: #{array_input[6]}"
  puts "August: #{array_input[7]}"
  puts "September: #{array_input[8]}"
  puts "October: #{array_input[9]}"
  puts "November: #{array_input[10]}"
  puts "December: #{array_input[11]}"
end

puts ""
puts "4) Average readings per month:"
puts ""
puts "Electric:"
print_averages(electric_averages)
puts ""
puts "Gas:"
print_averages(gas_averages)