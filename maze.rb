class Maze
    attr_accessor :input

    def initialize(input)
        @input = input
        validate
    end

    private

    def validate
        return get_input if @input.length < 2 || @input.class != Array
        @input.each_with_index do |element, index|
            return get_input if element.length < 2
        end if @input.class == Array
        get_results
    end

    def get_input
        @input = nil
        puts "You must enter a two-dimensional array, and each dimension must have at least 2 elements."
        puts "Please enter a two-dimensional array using this notation: [[1,2],[3,4]]."
        @input = eval(gets)
        validate
    end

    def get_results
        puts "Beep beep. Working."
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