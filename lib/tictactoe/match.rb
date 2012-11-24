module Tictactoe
  class Match
    def initialize(board, players)
      players = players.dup
      until board.finished?
        players.push(player = players.shift)
        board = player.move board
      end
      @board = board
    end

    def winner
      @board.winner
    end
  end
end
