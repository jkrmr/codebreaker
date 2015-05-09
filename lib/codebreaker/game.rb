module Codebreaker

  # Responsible for processing user input and handling turns
  class Game

    attr_reader :output

    def initialize(output)
      @output = output
    end

    def start(secret)
      output.puts 'Welcome to Codebreaker!'
      output.puts 'Enter guess:'
    end

    def guess(guess)
      output.puts guess
    end

  end

end
