$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "searchable/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "searchable"
  s.version     = Searchable::VERSION
  s.authors     = ["Géraud MATHE"]
  s.email       = ["mail@geraudmathe.com"]
  s.homepage    = "TODO"
  s.summary     = "This gem allow to perform searchs on mongoid models."
  s.description = "TODO: Description of Searchable."
  s.extra_rdoc_files = [ "README.md" ]
  s.files = Dir["{app,config,db,lib}/**/*"] + ["lib/generators/install/install_generator.rb","MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.5"
  s.add_dependency "haml-rails"
  s.add_dependency "twitter-bootstrap-rails"
  s.add_dependency "mongoid", "~> 3"
  s.add_development_dependency "mongoid", "~> 3"
end
