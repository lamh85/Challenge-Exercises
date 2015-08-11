# This is my second attempt at the Anagram problem.

puts "Give me a number!"

input = gets.chomp

puts "Your number is #{input}"

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

Reasoning:
first digit) keep the first digit
second digit) find the digit that is second largest or equal

=end