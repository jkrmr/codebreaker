# frozen_string_literal: true

module Codebreaker
  # Responsible for processing user input and handling turns
  class Game
    attr_reader :output

    def initialize(output)
      @output = output
    end

    def start(secret)
      @secret = secret
      output.puts "Welcome to Codebreaker!"
      output.puts "Enter guess:"
    end

    def guess(guess)
      marker = Marker.new(secret: @secret, guess: guess)
      exact = "+" * marker.exact_match_count
      number = "-" * marker.number_match_count

      output.puts exact + number
    end
  end
end
