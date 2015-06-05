module Codebreaker

  # Responsible for processing user input and handling turns
  class Game
    attr_reader :output

    def initialize(output)
      @output = output
    end

    def start(secret)
      @secret = secret
      output.puts 'Welcome to Codebreaker!'
      output.puts 'Enter guess:'
    end

    def guess(guess)
      mark = ''

      3.times { |i| mark << '+' if exact_match?(guess, i) }
      3.times { |i| mark << '-' if number_match?(guess, i) }

      output.puts mark
    end

    def number_match?(guess, index)
      @secret.include?(guess[index]) && !exact_match?(guess, index)
    end

    def exact_match?(guess, index)
      guess[index] == @secret[index]
    end
  end

end
