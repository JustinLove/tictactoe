require 'spec_helper'
require 'tictactoe/min_max_memo_player'
require 'tictactoe/min_max_brute_player'
require 'tictactoe/board'
require 'benchmark'

describe Tictactoe::MinMaxMemoPlayer do
  let(:cut) {Tictactoe::MinMaxMemoPlayer}
  let(:memo) {cut.new(O)}
  let(:brute) {Tictactoe::MinMaxBrutePlayer.new(O)}
  let(:board) {Tictactoe::Board.new([X,B,B, B,B,B, B,B,B])}
  let(:memo_move) {Benchmark.realtime {memo.move(board)}}
  let(:brute_move) {Benchmark.realtime {brute.move(board)}}
  it {memo_move.should < brute_move}
end
