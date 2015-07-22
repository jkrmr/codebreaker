module Codebreaker
  # Generates marks for displaying game outcomes
  class Marker
    attr_reader :guess, :secret

    def initialize(secret:, guess:)
      @secret = secret
      @guess = guess
    end

    def number_match_count
      total_match_count - exact_match_count
    end

    def total_match_count
      secret_chars = secret.chars

      guess.chars.reduce(0) do |count, n|
        count + (delete_first(secret_chars, n) ? 1 : 0)
      end
    end

    def delete_first(code, n)
      code_point = code.index(n)
      code.delete_at(code_point) if code_point
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
