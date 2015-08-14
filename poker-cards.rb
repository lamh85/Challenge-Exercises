puts "Give me an array!"
puts "To encode, use this format: ['Ac', 'Ks', '5h', 'Td', '3c']"
puts "To decode, use this format: [0, 51, 30, 22, 2]"
@input = gets.chomp.to_s

def encode
  puts "I am encoding"
end

def decode
  puts "I am decoding"
end

def validate
  is_invalid = false
  @input.each_with_index do |element,index|
    if (@input[index].class != @input[index-1].class) || (@input[index].class != @input[index+1].class)
      puts "==="
      puts "The neutral element's class is #{@input[index].class}"
      puts "The previous element's class is #{@input[index-1].class}"
      puts "The next element's class is #{@input[index+1].class}"
      is_invalid = true
      break
    end
  end
  if is_invalid == true
    puts "Your input is not valid."
  elsif @input[0].class == Fixnum
    decode
  else
    encode
  end
end

def to_array
  if @input.class != Array
    ["[", "]", " "].each do |replace_me|
      @input.gsub!(replace_me,"")
    end
    @input = @input.split(",")
  end
  puts "The value of to_array is #{to_array}"
  validate
end

to_array