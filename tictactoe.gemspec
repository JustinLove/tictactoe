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

  gem.files         = <<MANIFEST
README.md
LICENSE.txt
lib/tictactoe.rb
lib/tictactoe/version.rb
MANIFEST
  gem.test_files    = <<TEST_MANIFEST
TEST_MANIFEST
  gem.require_paths = ["lib"]
end
