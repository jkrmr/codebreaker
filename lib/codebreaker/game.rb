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
      marker = Marker.new(code: @secret)
      exact = '+' * marker.exact_match_count(guess)
      number = '-' * marker.number_match_count(guess)

      output.puts exact + number
    end

    class Marker
      def initialize(code: secret)
        @secret = code
      end

      def number_match_count(guess)
        (0..3).inject(0) do |count, i|
          match = number_match?(guess, i) ? 1 : 0
          count + match
        end
      end

      def exact_match_count(guess)
        (0..3).inject(0) do |count, i|
          match = exact_match?(guess, i) ? 1 : 0
          count + match
        end
      end

      def number_match?(guess, index)
        @secret.include?(guess[index]) && !exact_match?(guess, index)
      end

      def exact_match?(guess, index)
        guess[index] == @secret[index]
      end
    end
  end
end
