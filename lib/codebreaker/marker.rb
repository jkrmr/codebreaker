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
      count = 0
      secret = @secret.split('')

      @guess.split('').map do |n|
        if secret.include?(n)
          secret.delete_at(secret.index(n))
          count += 1
        end
      end

      count
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
