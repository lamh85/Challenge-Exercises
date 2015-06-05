puts "Give me a number"
n = gets.chomp.to_i

array = []

(1..n).each do |number|
  array << number
end

# Make sure that the first number to delete is the array's second element.
# For easier comparison with the array length, the "counter" variable counts the array from 1 instead of 0.
counter = 2

while array.length > 1
  while counter <= array.length
    puts "The array is #{array}"
    puts "Now deleting the number at position #{counter}"
    array.delete_at(counter-1)
    counter += 1
  end
  if counter == (array.length + 1)
    puts "*** Now reverting the counter to 1"
    counter = 1
  else
    puts "*** Now reverting the counter to 2"
    counter = 2
  end
end

puts "The final number is #{array}"

=begin

Assignment requirements:

Given a number n. 

Do the following:

1- Generate an array that goes from 1 to the number n (for instance if n=3 array would be [1, 2, 3]
2- keep looping through the array eliminating every second number until there is one element left and return that element. If you are at the end of the array loop around the same way.

For instance. If n = 5 then you get an array [1,2,3,4,5]
First round you would remove the 2 and 4 ending up with: 1, 3, 5 and because there is no element "6" you loop around and remove the 1 and then the 5. You are then left with number 3.

=end