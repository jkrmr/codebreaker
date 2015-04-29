module Codebreaker

  # Responsible for processing user input and handling turns
  class Game

    def initialize(output)
      @output = output
    end

    def start
      @output.puts 'Welcome to Codebreaker!'
      @output.puts 'Enter guess:'
    end

  end

end
