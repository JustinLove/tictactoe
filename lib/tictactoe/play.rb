require 'tictactoe/match'
require 'tictactoe/board'
require 'tictactoe/terminal_player'
require 'tictactoe/min_max_brute_player'

module Tictactoe
  def self.play!
    Match.new Board.new, [TerminalPlayer.new(X), MinMaxBrutePlayer.new(O)]
  end
end
