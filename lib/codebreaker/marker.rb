module Codebreaker
  # Generates marks for displaying game outcomes
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
