module Mastermind
  class Game
    def initialize(messenger)
      @messenger = messenger
    end

    def start(code)
      @code = code
      @messenger.puts 'Welcome to Mastermind!'
      @messenger.puts 'Enter guess:'
    end

    def guess(guess)
      result = guess.each_with_index.with_object([]) do |(peg, idx), chars|
        if @code[idx] == peg
          chars << 'b'
        elsif @code.include? peg
          chars << 'w'
        end
      end
      @messenger.puts result.sort.join
    end
  end
end

