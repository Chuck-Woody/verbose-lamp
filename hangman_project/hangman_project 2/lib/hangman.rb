class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses
  def self.random_word
    DICTIONARY.sample
  end

  def initialize

    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length,'_')
    @attempted_chars = []
    @remaining_incorrect_guesses = 5

  end

  def already_attempted?(char)

    @attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    match = []

    @secret_word.each_char.with_index {|ele,idx| match << idx if char == ele}

    match
  end

  def fill_indices(char,arr)
      
    arr.length.times { |idx| @guess_word[arr[idx]]= char }
  end

  def try_guess(char)

    if get_matching_indices(char).length < 1
      @remaining_incorrect_guesses -= 1
    else
      fill_indices(char,get_matching_indices(char))

    end

      if already_attempted?(char)
        print 'that has already been attempted'
       return false
      else
        @attempted_chars << char
        return true
      end

  end

  def ask_user_for_guess
    print 'Enter a char:'
    input = gets.chomp
    try_guess(input)

  end
  def win?
    if @guess_word.join("") == @secret_word
      print 'WIN'
      return true
    else
      return false
    end
  end

  def lose?

    if  @remaining_incorrect_guesses == 0 
      print 'LOSE' 
      return true 
      
    else
       return false
    end
  end
def game_over?

  if win? 

    print @secret_word
    return true
  end

  if lose?

    print @secret_word
    return true
  end

  return false
end



end

