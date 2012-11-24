require 'spec_helper'
require 'tictactoe/random_player'
require 'tictactoe/board'
require 'tictactoe'

include Tictactoe::Marks

describe Tictactoe::RandomPlayer do
  let(:cut) {Tictactoe::RandomPlayer}
  let(:player) {cut.new(X)}
  let(:board) {Tictactoe::Board.new}

  subject {player.move(board)}
  its(:blank) {should have(8).items}

  describe 'fills board' do
    before do
      @board = Tictactoe::Board.new
      7.times do
        @board = player.move(@board)
      end
    end
    subject {@board}
    its(:blank) {should have(2).items}
    its(:winner) {should == X}
  end
end
