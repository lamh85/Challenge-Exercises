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
  ["[", "]", " "].each do |replace_me|
    @input.gsub!(replace_me,"")
  end
  @input = @input.split(",")
  # If a string can stay the same after to_i.to_s, then it is a number
  if @input[0].to_i.to_s == @input[0]
    @input.each_with_index do |element,index|
      @input[index] = @input[index].to_i
    end
  validate
  end

  # validate
end

make_array
