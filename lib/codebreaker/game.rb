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
      exact = '+' * exact_match_count(guess)
      number = '-' * number_match_count(guess)

      output.puts exact + number
    end

    def number_match_count(guess)
      counter = 0

      3.times do |i|
        counter += 1 if number_match?(guess, i)
      end

      counter
    end

    def exact_match_count(guess)
      counter = 0

      3.times do |i|
        counter += 1 if exact_match?(guess, i)
      end

      counter
    end

    def number_match?(guess, index)
      @secret.include?(guess[index]) && !exact_match?(guess, index)
    end

    def exact_match?(guess, index)
      guess[index] == @secret[index]
    end
  end
end
