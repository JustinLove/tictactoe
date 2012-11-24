require 'spec_helper'
require 'tictactoe/board'
require 'tictactoe'

include Tictactoe::Marks

describe Tictactoe::Board do
  let(:cut) {Tictactoe::Board}

  describe 'blank board' do
    subject {cut.new}
    its(:blank) {should have(9).items}
    its(:blank) {should == (0..8).to_a}
    its(:winning?) {should be_false}
    its(:winner) {should == B}
  end

  describe 'full board' do
    subject {cut.new([X,O,X, O,X,O, X,O,X])}
    its(:blank) {should have(0).items}
  end

  describe 'after a move' do
    subject {cut.new.move(X, 0)}
    its(:blank) {should have(8).items}
    its(:blank) {should_not include(0)}
    its(:winning?) {should be_false}
    its(:winner) {should == B}
  end

  describe 'winning board' do
    subject {cut.new([X,B,B, B,X,B, B,B,X])}
    its(:winning?) {should be_true}
    its(:winner) {should == X}
  end
end
