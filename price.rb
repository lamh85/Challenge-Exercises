puts "Give me a number!"

input_array = gets.chomp.to_f.round(2).to_s.split(".")

input_hash = {
  whole: input_array[0],
  decimals: input_array[1]
}

whole_reversed = input_hash[:whole].reverse.split("")

whole_reversed_commas = []
whole_reversed.each_with_index do |element,index|
  whole_reversed_commas << element
  if (index + 1) % 3 == 0
    whole_reversed_commas << ","
  end
end

whole_commas = whole_reversed_commas.reverse.join("")

print whole_commas

