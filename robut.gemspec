$LOAD_PATH.push File.expand_path("../lib", __FILE__)
require "preferential/version"

Gem::Specification.new do |s|
  s.name = "robut"
  s.version = Robut::Version
  s.date = "2015-07-03"
  s.summary = "Ruby framework for reddit bots"
  s.description = "Ruby framework for reddit bots"

  s.authors = ["Edd Morgan"]
  s.email = "edd@eddmorgan.com"
  s.files = Dir["lib/**/*", "README.md"]
  s.homepage = "https://github.com/EddM/robut"
  s.license = "GPL"

  s.add_dependency "redditkit", "~> 1.0.1"
  s.add_dependency "daemons"

  s.add_development_dependency "rspec"
  s.add_development_dependency "webmock"
end
