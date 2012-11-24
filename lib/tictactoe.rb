require "tictactoe/version"

module Tictactoe
  module Marks
    X = :X
    O = :O
    B = :_
  end

  # simple `include` doesn't become visible in subclasses
  X = Marks::X
  O = Marks::O
  B = Marks::B
end
