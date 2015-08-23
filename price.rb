@input = ""

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
  if (/[1-9][0-9]*[\.0-9][0-9]*/.match(@input).class == MatchData)
    puts "checkpoint 1"
    validated
  else
    puts "One of the digits in your number is not a number. Please try again."
    get_input
  end
end

def get_input
  puts "Give me a number!"
  @input = gets.chomp
  validate
end

get_input