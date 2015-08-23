@input = ""

def get_input
  puts "Give me a number!"
  @input = gets.chomp
end

def validated
  input_array = @input.to_f.round(2).to_s.split(".")

  input_hash = {
    whole: input_array[0],
    decimals: input_array[1]
  }

  whole_reversed = input_hash[:whole].reverse.split("")

  whole_reversed_commas = []
  whole_reversed.each_with_index do |element,index|
    whole_reversed_commas << element
    if ((index + 1) % 3 == 0) && (index + 1 != whole_reversed.length)
      whole_reversed_commas << ","
    end
  end

  final_string = "$" + whole_reversed_commas.reverse.join("") + "." + input_hash[:decimals]

  puts "Your number in a price format is #{final_string}."
end

def validate
  # If @input can go through .to_f.to_s without becoming "0.0", then it is a legit float. Otherwise, the @input would have contained letters, which is an invalid @input.
  if @input.to_s == @input.to_f.to_s
    validated
  else
    puts "Your input contains letters. Please try again."
    get_input
  end
end