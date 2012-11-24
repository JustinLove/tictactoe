require 'spec_helper'
require 'tictactoe/terminal_player'
require 'tictactoe/board'

describe Tictactoe::TerminalPlayer do
  let(:cut) {Tictactoe::TerminalPlayer}
  let(:input) {StringIO.new}
  let(:output) {StringIO.new}
  let(:player) {cut.new(X, input, output)}
  let(:before) {Tictactoe::Board.new}
  let(:after) {player.move(before)}

  describe 'print board' do
    before do
      player.print_board(before)
      output.rewind
    end
    subject {output.read}
    it {should == <<BOARD}
0|1|2
-+-+-
3|4|5
-+-+-
6|7|8
BOARD
  end

  describe 'get_input' do
    let(:input) {StringIO.new("1\n")}
    subject {player.get_input}
    it {should == 1}
  end

  describe 'get move' do
    describe 'legal move' do
      let(:input) {StringIO.new("1\n")}
      subject {player.get_move(before)}
      it {should == 1}
    end

    describe 'illegal value' do
      let(:input) {StringIO.new("20\n1\n")}
      subject {player.get_move(before)}
      it {should == 1}
    end

    describe 'taken space' do
      let(:before) {Tictactoe::Board.new([B,O,B, B,B,B, B,B,B])}
      let(:input) {StringIO.new("1\n2\n")}
      subject {player.get_move(before)}
      it {should == 2}
    end
  end

  describe 'move' do
    let(:input) {StringIO.new("1\n")}
    subject {player.move(before)}
    its(:blank) {should have(8).items}
    its(:blank) {should_not include(1)}
  end
end
