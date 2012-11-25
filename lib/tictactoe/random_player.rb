module Tictactoe
  class RandomPlayer
    def initialize(mark)
      @mark = mark
    end

    def move(board)
      options = board.next_moves(@mark)
      options[rand(options.length)]
    end

    def game_over(board)
    end
  end
end
