require 'tictactoe'

module Tictactoe
  class Board
    def initialize(spaces = [B]*9)
      @field = spaces
    end

    def blank
      blanks = []
      @field.each_with_index {|s,i| blanks << i if s == B}
      blanks
    end

    def next_moves(mark)
      blank.map {|s| move(mark, s)}
    end

    def move(who, index)
      f = @field.dup
      f[index] = who
      self.class.new(f)
    end

    def winner
      Lines.each do |line|
        if (mark = winning_line(line)) != B
          return mark
        end
      end
      B
    end

    def winning?
      winner != B
    end

    def finished?
      winning? || blank.count == 0
    end

    def each_row(&block)
      @field.each_slice(3, &block)
    end

    def to_s
      "[#{@field.join(' ')}]"
    end

    private

    Lines = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ]

    def winning_line(line)
      if @field[line[0]] == @field[line[1]] && @field[line[1]] == @field[line[2]]
        @field[line[0]]
      else
        B
      end
    end
  end
end
