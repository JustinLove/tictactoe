require 'tictactoe/match'
require 'tictactoe/board'
require 'tictactoe/terminal_player'
require 'tictactoe/random_player'

module Tictactoe
  def self.play!
    Match.new Board.new, [TerminalPlayer.new(X), RandomPlayer.new(O)]
  end
end
