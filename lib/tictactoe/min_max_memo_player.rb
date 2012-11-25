require 'tictactoe/min_max_brute_player'

module Tictactoe
  class MinMaxMemoPlayer < MinMaxBrutePlayer
    private
    def minmax(mark, board)
      @memo ||= {}
      @memo[board] ||= super
    end
  end
end
