require 'spec_helper'
require 'tictactoe/min_max_brute_player'
require 'tictactoe/board'

describe Tictactoe::MinMaxBrutePlayer do
  let(:cut) {Tictactoe::MinMaxBrutePlayer}
  let(:player) {cut.new(X)}
  let(:before) {Tictactoe::Board.new}
  let(:after) {player.move(before)}
  subject {after}

  describe 'makes a move' do
    its(:blank) {should have(8).items}
  end

  describe 'takes a win' do
    let(:before) {Tictactoe::Board.new([X,B,B, X,B,B, B,B,B])}
    its(:winner) {should == X}
  end

  describe 'blocks a loss' do
    let(:before) {Tictactoe::Board.new([O,B,B, B,O,B, B,B,B])}
    its(:blank) {should_not include(8)}
  end

  describe 'prefer a win to a block' do
    let(:before) {Tictactoe::Board.new([O,O,B, B,B,B, X,X,B])}
    its(:blank) {should_not include(8)}
  end

  describe 'not be stupid' do
    let(:before) {Tictactoe::Board.new([X,O,B, B,B,B, B,B,B])}
    its(:blank) {should include(2)}
  end

  describe 'score' do
    subject {player}
    it {subject.score(X, Tictactoe::Board.new([B,B,B, B,B,B, B,B,B])).should == 0}
    it {subject.score(X, Tictactoe::Board.new([X,X,X, B,B,B, B,B,B])).should == 1}
    it {subject.score(X, Tictactoe::Board.new([O,O,O, B,B,B, B,B,B])).should == -1}
    it {subject.score(X, Tictactoe::Board.new([X,X,B, B,B,B, B,B,B])).should == 0}
  end

  describe 'minmax' do
    subject {player}
    it {subject.minmax(X, Tictactoe::Board.new([X,X,X, B,B,B, B,B,B])).last.should == 1}
    it {subject.minmax(X, Tictactoe::Board.new([O,O,O, B,B,B, B,B,B])).last.should == -1}
    it {subject.minmax(X, Tictactoe::Board.new([X,X,B, B,B,B, B,B,B])).last.should == 1}
    it {subject.minmax(O, Tictactoe::Board.new([X,B,B, B,B,B, B,B,B])).last.should == 0}
    it {subject.minmax(X, Tictactoe::Board.new([X,B,B, B,B,B, B,B,O])).last.should > 0}
    it {subject.minmax(X, Tictactoe::Board.new([X,B,B, B,O,B, B,B,B])).last.should == 0}
  end

  describe 'case studies' do
    let(:player) {cut.new(O)}

    describe '1' do
      let(:before) {Tictactoe::Board.new([X,B,X, B,B,B, B,B,O])}
      it {after.blank.should_not include(1)}
    end

    describe '2' do
      let(:before) {Tictactoe::Board.new([X,B,B, B,B,B, B,B,B])}
      it {after.blank.should_not include(4)}
    end

    describe 'working back' do
      RSpec::Matchers.define :play do |mark, space|
        match do |beginning_board|
          player = cut.new(mark)
          board = Tictactoe::Board.new(beginning_board)
          !player.move(board).blank.include?(space)
        end

        failure_message_for_should do |beginning_board|
          player = cut.new(mark)
          board = Tictactoe::Board.new(beginning_board)
          actual = player.move(board)
          expected = board.move(mark, space)
          "expected #{expected}, but got #{actual}"
        end

        description do |beginning_board|
          player = cut.new(mark)
          board = Tictactoe::Board.new(beginning_board)
          expected = board.move(mark, space)
          "play #{board} to #{expected}"
        end
      end

      it {[X,X,O, O,O,B, X,B,B].should play(X, 5)}
      it {[X,X,O, B,O,B, X,B,B].should play(O, 3)}
      it {[X,X,O, B,O,B, B,B,B].should play(X, 6)}
      it {[X,X,B, B,O,B, B,B,B].should play(O, 2)}
      it {[X,B,B, B,O,B, B,B,B].should play(X, 1)}
      it {[X,B,B, B,B,B, B,B,B].should play(O, 4)}
      it {[B,B,B, B,B,B, B,B,B].should play(X, 0)}
    end
  end
end
