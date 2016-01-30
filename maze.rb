class Maze
    attr_accessor :input

    def initialize(input)
        @input = input
        puts "You must enter a two-dimensional array, and each dimension must have at least 2 elements" if !validate
    end

    private

    def validate
        return false if @input.length < 2 || @input.class != Array
        @input.each_with_index do |element, index|
            return false if element.length < 2
        end if @input.class == Array
        return true
    end
end

# def validate
    # check if two dimensional array
# end

=begin

1 0 1
1 1 1
0 0 1

=end