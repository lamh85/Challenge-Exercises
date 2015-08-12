# My third attempt at the Anagram problem

puts "Give me a number!"

# Get info
@input = gets.chomp

@inventory = []
@analyze_index = 0

# Chop the tail digits for re-arrangement
def grow_inventory(tail_index)
  @inventory << @input.to_s[tail_index]
  @inventory = @inventory.sort.reverse
  @analyze_index = @input.to_s.length - @inventory.length
end

# Initialize @inventory
grow_inventory(-1)
grow_inventory(-2)
@next_tail_index = -2 # Starting at -2 so that the function can decrement it to -3

# Shoveling machine
@results_array = []
def transfer_number(number)
  @results_array << number
  @inventory.delete_at(@inventory.find_index(number))
end

# Successfully found a lower digit. Shovel that digit and then all the digits in descending order.
def write_answer(index)
  middle_digit = @inventory[index]
  @inventory.delete_at(index)
  input_cutoff = @input.to_s.length - @inventory.length - 2
  final_number = @input.to_s[0..input_cutoff] + middle_digit + @inventory.join()
  puts "The next highest anagram is #{final_number}"
end

# Check if there is a digit that is lower than the original number's digit
def cycle_inventory
  has_result = false
  inventory_index = 0
  while (has_result == false && inventory_index < @inventory.length)
    if @inventory[inventory_index].to_i < @input.to_s[@analyze_index].to_i
      write_answer(inventory_index)
      has_result = true
    else
      inventory_index = inventory_index + 1
    end
  end
  if (@inventory.length < @input.to_s.length) && (has_result == false)
    @next_tail_index = @next_tail_index - 1
    grow_inventory(@next_tail_index)
    cycle_inventory
  elsif (@inventory.length >= @input.to_s.length) && (has_result == false)
    puts "There is no next highest anagram"
    has_result = true
  end
end

cycle_inventory

=begin
  
EXAMPLES:

223445
------
223445 <-- can't swap the last 2 digits
223445 <-- can't re-arrange the last 3 digits
223445 <-- can't re-arrange the last 4 digits
223445 <-- can't re-arrange all of the digits after the 1st

54321
-----
54312 <-- Able to swap the last 2 digits

LOGIC:

The next largest anagram is the anagram that preserves the most digits from the left.

Therefore, the program should start analyzing from the tail end.
  
=end
