puts "Give me an array!"
puts "To encode, use this format: ['Ac', 'Ks', '5h', 'Td', '3c']"
puts "To decode, use this format: [0, 51, 30, 22, 2]"
@input = gets.chomp.to_s

@is_invalid = false

def encode
  puts "I am encoding"
end

def decode
  puts "I am decoding"
end

def check_elements(correct_class)
  @input.each do |element|
    if element.class != correct_class
      @is_invalid = true
    end
  end
end

def validate
  if @input[0].class == String
    puts "checkpoint 1"
    check_elements(String)
  elsif @input[0].class == Fixnum
    puts "checkpoint 2"
    check_elements(Fixnum)
  else
    puts "checkpoint 3"
    @is_invalid = true
  end
  if @is_invalid == true
    puts "Your input is not valid."
  elsif @input[0].class == Fixnum
    decode
  else
    encode
  end
end

def make_array
  puts "I am a #{@input.class}"
  puts "I am a #{@input[0]}"
  ["[", "]", " "].each do |replace_me|
    @input.gsub!(replace_me,"")
  end
  @input = @input.split(",")
  puts "The array is now #{@input}"
  # If a string can stay the same after to_i.to_s, then it is a number
  if @input[0].to_i.to_s == @input[0]
    @input.each_with_index do |element,index|
      # puts "The element is #{element}"
      # puts "The index is #{index}"
      @input[index] = @input[index].to_i
      puts "The element's class is now #{@input[index].class}"
    end
  puts "The array is now #{@input}"
  validate
  end

  # puts "The value of make_array is #{@input}"
  # validate
end

make_array
# puts @input.class
# puts @input