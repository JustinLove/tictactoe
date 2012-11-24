require 'spec_helper'
require 'tictactoe/match'
require 'tictactoe/random_player'
require 'tictactoe/board'
require 'tictactoe'

include Tictactoe::Marks

describe Tictactoe::Match do
  let(:cut) {Tictactoe::Match}
  let(:x) {Tictactoe::RandomPlayer.new(X)}
  let(:o) {Tictactoe::RandomPlayer.new(O)}

  def play_match
    cut.new(Tictactoe::Board.new, [x, o])
  end

  let(:match) {play_match}

  subject {match}
  its(:winner) {should be}

  describe 'usually wins', :fragile => true do
    let(:matches) {(0..9).map {play_match.winner}}
    let(:x_wins) {matches.count(X)}
    let(:o_wins) {matches.count(O)}
    let(:ties) {matches.count(B)}
    it {x_wins.should > 0}
    it {o_wins.should > 0}
    it {ties.should < 5}
  end
end
