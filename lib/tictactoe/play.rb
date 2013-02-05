require 'tictactoe/match'
require 'tictactoe/board'
require 'tictactoe/terminal_player'
require 'tictactoe/min_max_memo_player'

module Tictactoe
  def self.play!
    Match.new(Board.new, [TerminalPlayer.new(X), MinMaxMemoPlayer.new(O)]).play!
  end
end
