module Tictactoe
  class TerminalPlayer
    def initialize(mark, input = STDIN, output = STDOUT)
      @mark = mark
      @input = input
      @output = output
    end

    def move(board)
      board.move(@mark, get_move(board))
    end

    def print_board(board)
      index = 0
      rows = []
      board.each_row do |row|
        rows << row.map do |space|
          rep = case space
          when X; 'X'
          when O; 'O'
          when B; index.to_s
          end
          index += 1
          rep
        end.join('|')
      end
      @output.puts rows.join("\n-+-+-\n")
    end

    def game_over(board)
      print_board(board)

      @output.puts case board.winner
      when B; 'Tie'
      when @mark; 'You Win'
      else ; 'You Lose'
      end
    end

    def get_input
      @output << "#{@mark} Enter move # "
      @input.gets.to_i
    end

    def get_move(board)
      @output.puts
      print_board(board)

      blanks = board.blank
      n = get_input until blanks.include?(n)
      n
    end
  end
end
