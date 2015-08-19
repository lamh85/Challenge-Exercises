# To run this app: irb -r ./sorted-list.rb

class List

  @array = []

  def self.all
    puts "The list is now: #{@array.sort}"
  end

  def self.length
    puts "The size of the list is #{@array.length}"
  end

  def self.add(new_item)
    @array << new_item
    puts "Added this element: #{new_item}"
    puts "The list is now: #{@array}"
  end

  def self.get(position)
    puts "The element is #{@array[position-1]}"
  end

end