# encoding: UTF-8

$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "rack-combobot"
  s.version     = "0.2.2"
  s.authors     = ["Simon Højberg", "Christopher Meiklejohn"]
  s.email       = ["r.hackr@gmail.com", "christopher.meiklejohn@gmail.com"]
  s.homepage    = "https://github.com/hojberg/rack-combobot"
  s.summary     = "asset combinator"
  s.description = "combines assets to server 1 file"

  s.rubyforge_project = "rack-combobot"

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
