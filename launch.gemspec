$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "launch/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "launch"
  s.version     = Launch::VERSION
  s.authors     = ["Ryan Francis"]
  s.email       = ["ryan@launchpadlab.com"]
  s.homepage    = "http://www.launchpadlab.com"
  s.summary     = "Launching apps since 2012"
  s.description = ""
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails"
  s.add_dependency "bourbon"
  s.add_dependency "refills"
  s.add_dependency "neat"
end
