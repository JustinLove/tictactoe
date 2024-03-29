require 'spec_helper'
require 'tictactoe/board'

describe Tictactoe::Board do
  let(:cut) {Tictactoe::Board}

  describe 'blank board' do
    subject {cut.new}
    its(:blank) {should have(9).items}
    its(:blank) {should == (0..8).to_a}
    its(:finished?) {should be_false}
    its(:winning?) {should be_false}
    its(:winner) {should == B}
    it {subject.next_moves(X).should have(9).items}
  end

  describe 'after a move' do
    subject {cut.new.move(X, 0)}
    its(:blank) {should have(8).items}
    its(:blank) {should_not include(0)}
    its(:finished?) {should be_false}
    its(:winning?) {should be_false}
    its(:winner) {should == B}
    it {subject.next_moves(X).should have(8).items}
  end

  describe 'winning board' do
    subject {cut.new([X,B,B, B,X,B, B,B,X])}
    its(:finished?) {should be_true}
    its(:winning?) {should be_true}
    its(:winner) {should == X}
  end

  describe 'tied board' do
    subject {cut.new([X,O,X, X,O,X, O,X,O])}
    its(:blank) {should have(0).items}
    its(:finished?) {should be_true}
    its(:winning?) {should be_false}
    its(:winner) {should == B}
    it {subject.next_moves(X).should have(0).items}
  end

  describe 'each_row' do
    subject {
      @rows = []
      cut.new.each_row {|row| @rows << row}
      @rows
    }
    it {should == [[B,B,B], [B,B,B], [B,B,B]]}
  end

  describe 'hashable' do
    let(:a) {cut.new}
    let(:b) {cut.new}
    it {a.hash.should == b.hash}
    it {a.should eql(b)}
    it do
      x = {}
      x[a] = true
      x[b].should be_true
    end
  end
end
