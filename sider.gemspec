# -*- encoding: utf-8 -*-
require File.expand_path('../lib/sidir/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Paul Samuels"]
  gem.email         = ["paulio1987@gmail.com"]
  gem.description   = %q{iOS Simulator directory explorer. This gem is a personal tool intended to make it slightly easier to navigate/manage the iOS Applications directory}
  gem.summary       = %q{iOS Simulator directory explorer}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "sidir"
  gem.require_paths = ["lib"]
  gem.version       = Sidir::VERSION
end
