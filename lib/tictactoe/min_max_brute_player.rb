require 'tictactoe'

module Tictactoe
  class MinMaxBrutePlayer
    def initialize(mark)
      @mark = mark
    end

    def move(board)
      return board.move(@mark, 0) if board.blank.length == 9 # short circuit worst case
      board.next_moves(@mark).min_by {|n| minmax(opponent(@mark), n)}
    end

    def score(mark, board)
      case board.winner
      when mark; 1
      when opponent(mark); -1
      else 0
      end
    end

    def minmax(mark, board)
      if board.finished?
        score(mark, board)
      else
        board.next_moves(mark).map {|n| -minmax(opponent(mark), n)}.max * future_discount
      end
    end

    def game_over(board)
    end

    private
    def opponent(mark)
      mark == X ? O : X
    end

    def future_discount
      0.9
    end
  end
end
