# This is my second attempt at the Anagram problem.

@results_array = Array.new

puts "Give me a number!"

input = gets.chomp

puts "Your number is #{input}"

anagram_created = false

input_array = input.to_s.split("")

# Sort from largest to smallest
@inventory = input.to_s.split("").sort.reverse

# puts "@results_array is #{@results_array}"

def transfer_number(number)
  @results_array.push(number)
  # Delete only ONE instance from @inventory
  @inventory.delete_at(@inventory.find_index(number))
  puts "@results_array is #{@results_array}"
end

input_array.length.times do |input_index|
  if input_index == 0
    transfer_number(input_array[input_index])
  # Iterate through the @inventory
  elsif @results_array[input_index] == nil
    @inventory.each do |available_digit|
      if anagram_created == true
        # Transfer the largest digit from the @inventory
        transfer_number(@inventory[0])
      elsif (available_digit.to_i <= input_array[input_index].to_i)
        transfer_number(input_array[input_index])
        if input_array[input_index] != available_digit
          anagram_created = true
        end
      end # If anagram_created == true
    end # Iterate through @inventory
  end # If input_index == 0
end

# puts @results_array
# puts ""
# puts @inventory

# Convert to strong
# Split each digit into an array of digits

=begin

EXAMPLES:
Input: 3222
Answer: 3222

Input: 2321
Answer: 2bcd -> 22cd -> 2231

Input: 23231
Answer: 2bcde -> 23cde -> 232de -> 2321e -> 23213

PROCESS:

For each digit, check against the input.
The only digits that are acceptable are:
- less than the input's
- equal to the input's
- whichever is greater

Throughout this process, use a state variable to keep track of whether any of the digits created an anagram (a number that is DIFFERENT from the input). If yes, then the subsequent digits can be higher than the input's.


=end