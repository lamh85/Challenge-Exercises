puts "Give me an array!"
puts "To encode, use this format: ['Ac', 'Ks', '5h', 'Td', '3c']"
puts "To decode, use this format: [0, 51, 30, 22, 2]"
@input = gets.chomp.to_s

@is_invalid = false
@validation_msg = ""

@decode_numbers = ["A","2","3","4","5","6","7","8","9","T","J","Q","K"] # Index number = encoded number % (suit index * 13)
@decode_suits = ["c","d","h","s"] # Index number = encoded number / 13 .to_i
@results = []

def decode
  @input.each do |element|
    element = element.to_i
    suit_index = (element / 13)
    decoded_suit = @decode_suits[suit_index]
    number_index = element % (suit_index * 13) if suit_index > 0
    number_index = element if suit_index == 0
    decoded_number = @decode_numbers[number_index]
    @results << decoded_number + decoded_suit
  end
  puts "The decoded array is #{@results}"
end

def encode
  @input.each do |element|
    number = element[0]
    suit = element[1]
    @results << @decode_suits.find_index(suit) * 13 + @decode_numbers.find_index(number)
  end
  puts "The encoded array is #{@results}"
end

def check_elements(correct_class)
  @input.each do |element|
    if element.class != correct_class
      @is_invalid = true
      @validation_msg = "Error: at least one of the elements' format does not match the others'."
    end
    if !((correct_class == String) && (element[0].to_i >= 2 || element[0].to_i <= 9 || element[0].upcase == "A" || element[0].upcase == "T" || element[0].upcase == "J" || element[0].upcase == "Q" || element[0].upcase == "K") && (element.length == 2))
      @is_invalid = true
      @validation_msg = "This array element does not represent a card value: #{element}."
      return @validation_msg
    elsif (correct_class == Fixnum) && (element < 0 || element > 51)
      @is_invalid = true
      @validation_msg = "This array element is not between 0 and 51 inclusive: #{element}."
      return @validation_msg
    end
  end
end

def validate
  if @input[0].class == String
    check_elements(String)
  elsif @input[0].class == Fixnum
    check_elements(Fixnum)
  else
    @is_invalid = true
  end
  if @is_invalid == true
    if @validation_msg == ""
      puts "Your array did not pass a validation error"
    else
      puts @validation_msg
    end
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
  puts "@input = #{@input}"
  puts "@input = #{@input.class}"
  @input = @input.split(",")
  # If a string can stay the same after to_i.to_s, then it is a number
  if @input[0].to_i.to_s == @input[0]
    @input.each_with_index do |element,index|
      @input[index] = @input[index].to_i
    end
  end
  validate
end

make_array