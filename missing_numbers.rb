puts "Give me an array! Please separate each element with a comma, and don't use square brackets. EG: 1,2,3"
array = gets.chomp.split(",")

has_missing = false
(array.length + 1).times do |x|
  y = (x + 1).to_s
  if array.index(y) == nil
    puts "The missing number is #{y}."
    has_missing = true
  end
end

if has_missing == false
  puts "There is no missing number."
end