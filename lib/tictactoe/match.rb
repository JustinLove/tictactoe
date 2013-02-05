module Tictactoe
  class Match

    attr_accessor :board, :players

    def initialize(board, players)
      @board = board
      @players = players
    end

    def play!
      until over?
        player = rotate_players
        self.board = player.move board
      end
      announce_game_over
    end

    def winner
      board.winner
    end

    private

    def over?
      board.finished?
    end

    def rotate_players
      players.push(player = players.shift)
      player
    end

    def announce_game_over
      players.each {|player| player.game_over(board)}
    end
  end
end
