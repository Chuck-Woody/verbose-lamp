class GuessingGame

    def initialize(min,max)
        @min = min
        @max = max
        @secret_num = rand(min..max)
        @num_attempts = 0
        @game_over = false
    end
    def num_attempts
        @num_attempts
        #hello again asdf
    end

    def game_over?
        @game_over
    end
    def check_num(num)
         if num == @secret_num
            @game_over = true
            puts 'you win'
         elsif num > @secret_num
            puts "too big"
        elsif num < @secret_num
            puts "too small"
        end
        @num_attempts += 1
    end
    def ask_user
        puts 'enter a number'
        input = gets.chomp
        check_num(input.to_i)
    end
end 
