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
      marker = Marker.new(secret: @secret, guess: guess)
      exact = '+' * marker.exact_match_count
      number = '-' * marker.number_match_count

      output.puts exact + number
    end

    class Marker
      attr_reader :guess, :secret

      def initialize(secret:, guess:)
        @secret = secret
        @guess = guess
      end

      def number_match_count
        (0..3).inject(0) do |count, i|
          match = number_match?(i) ? 1 : 0
          count + match
        end
      end

      def exact_match_count
        (0..3).inject(0) do |count, i|
          match = exact_match?(i) ? 1 : 0
          count + match
        end
      end

      def number_match?(index)
        secret.include?(guess[index]) && !exact_match?(index)
      end

      def exact_match?(index)
        guess[index] == secret[index]
      end
    end
  end
end
