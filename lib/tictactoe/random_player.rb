module Tictactoe
  class RandomPlayer
    def initialize(mark)
      @mark = mark
    end

    def move(board)
      board.move(@mark, select_move(board))
    end

    def game_over(board)
    end

    private
    def select_move(board)
      options = board.blank
      options[rand(options.length)]
    end
  end
end
