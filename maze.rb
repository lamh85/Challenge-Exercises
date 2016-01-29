class Maze
    attr_accessor :input

    def initialize(input)
        @input = input
        puts "You must enter a two-dimensional array, and each dimension must have at least 2 elements" if !validate
    end

    private

    def validate
        is_valid = true
        is_valid = false if @input.length < 2 # test length of outer dimension
        if @input.class == Array
            @input.each do |element| # test length of the deeper dimension
                is_valid = false if element.length < 2
            end
        else
            is_valid = false
        end
        return is_valid
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