require 'tictactoe'

module Tictactoe
  class MinMaxBrutePlayer
    def initialize(mark)
      @mark = mark
    end

    def move(board)
      return board.move(@mark, 0) if board.blank.length == 9 # short circuit worst case
      minmax(@mark, board).first
    end

    def score(mark, board)
      case board.winner
      when mark; 1
      when opponent(mark); -1
      else 0
      end
    end

    def minmax(mark, board)
      board.next_moves(mark).map {|n|
        [n, item_score(mark, n)]
      }.max_by {|n,s| s}
    end

    def item_score(mark, board)
      if board.finished?
        score(mark, board)
      else
        -minmax(opponent(mark), board).last * future_discount
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
