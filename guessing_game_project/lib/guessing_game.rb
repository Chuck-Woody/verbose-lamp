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
        #hello again
    end

    def game_over?
        @game_over
    end
    def check_num(num)
        @game_over = true if num == @secret_num
        @num_attempts += 1
    end
end
