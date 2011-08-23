# -*- encoding: utf-8 -*-
require File.expand_path('../lib/bluevia_api/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Chris Mytton"]
  gem.email         = ["chrism@simpleweb.co.uk"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "bluevia_api"
  gem.require_paths = ["lib"]
  gem.version       = BlueviaApi::VERSION

  gem.add_dependency "oauth", "~> 0.4.5"
  gem.add_dependency "log4r"
  gem.add_development_dependency "rake", "~> 0.9.2"
  gem.add_development_dependency "webmock"
end
