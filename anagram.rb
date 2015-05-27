puts "Give me a number!"
number_original = gets.chomp

tail_start = -1
array_is_more = false
digit_new = nil
digits_tail = []

while digits_tail.length < ( number_original.to_s.length + 1 )

  # Create an array of last digits
  digits_tail = number_original.to_s[tail_start..-1]
  puts "digits_tail is now #{digits_tail}. The class is a #{digits_tail.class}"
  digits_tail = digits_tail.split("")

  # Convert each element to an integer
  counter = 0
  digits_tail.each do |element|
    digits_tail[counter] = element.to_i
    counter += 1
  end

  # Sort the array in descending order
  digits_tail.sort! { |x,y| y <=> x }
  puts "digits_tail is now sorted: #{digits_tail}"

  # Find one digit to the left
  digit_analyzed = number_original[tail_start-1].to_i
  puts "digit_analyzed is #{digit_analyzed}"

  # Is there an element that is less than digit_analyzed ?
  digits_tail.each do |digit|
    puts "The 'digit' variable is #{digit}. The class is #{digit.class}"
    puts "The digit_analyzed is #{digit_analyzed}. The class is #{digit_analyzed.class}"
    if digit < digit_analyzed
      array_is_more = true
      # This digit will replace the analyzed digit
      digit_new = digit.to_i
      puts "There is a digit in the tail array that is less than digit_analyzed. digit_new is #{digit_new}"
    end
  end

  tail_start -= 1

end

# This block is for resequencing the digits
###########################################

# Add the old digit into the array
digits_tail << digit_analyzed
puts "digit_analyzed has been added to the array: #{digits_tail.to_s}"
# Replace the analyzed digit with the new one prescribed by the loop
digit_analyzed = digit_new
puts "digit_analyzed is now #{digit_analyzed}"
# Delete the new digit from the array
digits_tail.delete(digit_new)
puts "digit_new has been deleted from the array: #{digits_tail}"
# Sort the array in descending order
digits_tail.sort! { |x,y| y <=> x }
puts "digits_tail is now sorted in descending: #{digits_tail.to_s}"

number_new = number_original[0..(tail_start-1)].to_s + digit_analyzed.to_s + digits_tail.join("").to_s
puts "The next highest anagram is #{number_new}"



=begin

Assignment requirements:

An anagram number is a number formed by rearranging the digits of another. For instance, 2134 is an anagram of 1234. Write a class called AnagramFinder that is initialized with a starting number and has a method called next_highest that returns the next highest number that is an anagram of the starting number. If a next highest anagram does not exist, return the starting number.

=end


# (0..(number.length - 1) ).each do |index|
#   array_original << number[index].to_i
# end

# tail_start = -2
# number_new = ""
# digits_tail = ""

# while digits_tail.length <= (number_original.length - 1)

#   digits_tail = number_original[tail_start..-1].split("")
#   digits_head = number_original[0..(tail_start-1)]
#   digits_tail.sort! { |x,y| y <=> x }
#   digits_tail = digits_tail.join("")  
#   number_new = digits_head.to_s + digits_tail.to_s

#   puts "digits_head = #{digits_head}"
#   puts "digits_tail = #{digits_tail}"
#   puts "number_new = #{number_new}"

#   if number_new.to_i < number_original.to_i
#     puts "The next highest anagram is #{number_new}"
#     break
#   elsif digits_tail.length == number_original.length
#     puts "There is no next highest anagram"
#     break
#   else
#     tail_start -= 1
#     puts "Decrementing tail_start by 1"
#   end

# end