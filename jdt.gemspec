# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

require "jdt/version"

Gem::Specification.new do |s|
  s.name        = "jdt"
  s.version = Jdt::VERSION
  s.authors = ['Simon Harrer', 'Andreas Vorndran', 'Sebastian Boosz']
  s.email = ['simon.harrer@feki.de','andreas.vorndran@feki.de', 'sebastian.boosz@feki.de']
  s.homepage = 'https://github.com/Fekide/joomlatools'
  s.summary = %q{A command line tool for developing Joomla Extensions}
  s.description = %q{A command line tool to help developing Joomla Extensions. }

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "nokogiri"
  s.add_dependency "thor","0.15.0.rc2"
  s.add_dependency "rubyzip"
  s.add_dependency "launchy"
  s.add_dependency "mechanize"
  s.add_development_dependency "rspec"
  s.add_development_dependency "cucumber"
  s.add_development_dependency "aruba"
end