# encoding: UTF-8

$:.push File.expand_path("../lib", __FILE__)
require "rack-combot/version"

Gem::Specification.new do |s|
  s.name        = "rack-combot"
  s.version     = Rack::Combot::VERSION
  s.authors     = ["Simon Højberg", "Christopher Meiklejohn"]
  s.email       = ["r.hackr@gmail.com", "christopher.meiklejohn@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "rack-combot"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "rake"
  s.add_dependency "rack"

  s.add_development_dependency "minitest"
  s.add_development_dependency "rack-test"
  s.add_development_dependency "guard"
  s.add_development_dependency "guard-minitest"
end
