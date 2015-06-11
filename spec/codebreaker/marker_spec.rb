require 'spec_helper'

module Codebreaker
  describe Marker do
    describe '#exact_match_count' do
      context 'with no matches' do
        it 'returns 0' do
          marker = Marker.new(secret: '1234', guess: '5555')

          count = marker.exact_match_count

          expect(count).to eq 0
        end
      end

      context 'with 1 exact match' do
        it 'returns 1' do
          marker = Marker.new(secret: '1234', guess: '1555')

          matches = marker.exact_match_count

          expect(matches).to eq 1
        end
      end

      context 'with 1 number match' do
        it 'returns 0' do
          marker = Marker.new(secret: '1234', guess: '2555')

          matches = marker.number_match_count

          expect(matches).to eq 1
        end
      end

      context 'with 1 exact match and 1 number match' do
        it 'returns 1' do
          marker = Marker.new(secret: '1234', guess: '1525')

          matches = marker.number_match_count

          expect(matches).to eq 1
        end
      end
    end
  end
end
