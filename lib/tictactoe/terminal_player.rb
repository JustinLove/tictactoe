module Tictactoe
  class Terminal
    def initialize(input, output)
      @input = input
      @output = output
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

    def get_input(mark)
      @output << "#{mark} Enter move # "
      @input.gets.to_i
    end

    def announce_winner(winner, mark)
      @output.puts case winner
      when B; 'Tie'
      when mark; 'You Win'
      else ; 'You Lose'
      end
    end

    def print_blank_line
      @output.puts
    end
  end

  class TerminalPlayer
    def initialize(mark, input = STDIN, output = STDOUT)
      @mark = mark
      @input = input
      @output = output
      @terminal = Terminal.new(input, output)
    end

    def move(board)
      board.move(@mark, get_move(board))
    end

    def game_over(board)
      @terminal.print_board(board)
      @terminal.announce_winner(board.winner, @mark)
    end

    def print_board(board)
      @terminal.print_board(board)
    end

    def get_input
      @terminal.get_input(@mark)
    end

    def get_move(board)
      @terminal.print_blank_line
      @terminal.print_board(board)

      blanks = board.blank
      n = @terminal.get_input(@mark) until blanks.include?(n)
      n
    end
  end
end
