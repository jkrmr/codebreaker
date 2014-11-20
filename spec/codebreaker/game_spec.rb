require 'spec_helper'

module Codebreaker
  describe Game do
    context 'starting up' do
      before :each do
        @messenger = double('messenger').as_null_object
        @game = Game.new(@messenger)
      end

      it 'sends a welcome message (passing the code to start)' do
        expect(@messenger).to receive(:puts).with('Welcome to Codebreaker!')
        @game.start %w(r g y c)
      end

      it 'prompts for the first guess' do
        expect(@messenger).to receive(:puts).with('Enter guess:')
        @game.start %w(r g y c)
      end
    end

    context 'marking a guess' do
      context 'with all 4 colors correct and correctly positioned' do
        it 'marks the guess with bbbb' do
          messenger = double('messenger').as_null_object
          game = Game.new(messenger)
          game.start %w(r g y c)
          expect(messenger).to receive(:puts).with('bbbb')
          game.guess %w(r g y c)
        end
      end

      context 'with all 4 colors correct and 2 correctly positioned' do
        it 'marks the guess with bbww' do
          messenger = double('messenger').as_null_object
          game = Game.new(messenger)
          game.start %w(r g y c)
          expect(messenger).to receive(:puts).with('bbww')
          game.guess %w(r g c y)
        end
      end

      context 'with all 4 colors correct and 1 correctly positioned' do
        it 'marks the guess with bbww' do
          messenger = double('messenger').as_null_object
          game = Game.new(messenger)
          game.start %w(r g y c)
          expect(messenger).to receive(:puts).with('bwww')
          game.guess %w(y r g c)
        end
      end
    end
  end
end

