$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "mocha_rails/version"

Gem::Specification.new do |s|
  s.name        = "mocha_rails"
  s.version     = MochaRails::VERSION
  s.authors     = ["Chris smith"]
  s.email       = ["quartzmo@gmail.com"]
  s.homepage    = "https://github.com/quartzmo/mocha_rails"
  s.summary     = "Integrates the Mocha JavaScript test framework with the Rails (>= 3.1) Asset Pipeline."
  s.description = "MochaRails is a mountable Rails engine that serves a browser-based Mocha test suite, along with your production JavaScript files, via the Asset Pipeline."

  s.files = Dir["{app,config,lib,vendor}/**/*"] + ["MIT-LICENSE", "Rakefile", "Readme.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 3.1.0"
end
