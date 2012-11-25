# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tictactoe/version'

Gem::Specification.new do |gem|
  gem.name          = "tictactoe"
  gem.version       = Tictactoe::VERSION
  gem.authors       = ["Justin Love"]
  gem.email         = ["git@JustinLove.name"]
  gem.description   = %q{
An unbeatable tic tac toe application. This has some basic requirements:

-Human player can play against the computer.
-The AI should be unbeatable, and it should take the winning move whenever possible.

There are no requirements around the interface or the language - it's your choice.
}
  gem.summary       = %q{An unbeatable tic tac toe application.}
  gem.homepage      = ""

  gem.files         = <<MANIFEST.split("\n")
lib/tictactoe/board.rb
lib/tictactoe/match.rb
lib/tictactoe/min_max_brute_player.rb
lib/tictactoe/min_max_memo_player.rb
lib/tictactoe/play.rb
lib/tictactoe/random_player.rb
lib/tictactoe/terminal_player.rb
lib/tictactoe/version.rb
lib/tictactoe.rb
LICENSE.txt
README.md
MANIFEST
  gem.test_files    = <<TEST_MANIFEST.split("\n")
spec/spec_helper.rb
spec/tictactoe/board_spec.rb
spec/tictactoe/match_spec.rb
spec/tictactoe/min_max_brute_player_spec.rb
spec/tictactoe/min_max_memo_player_spec.rb
spec/tictactoe/random_player_spec.rb
spec/tictactoe/terminal_player_spec.rb
TEST_MANIFEST
  gem.require_paths = ["lib"]
  gem.bindir = 'bin'
  gem.executables = 'tictactoe'

  gem.add_development_dependency "guard-rspec"
  gem.add_development_dependency "mast"
end
