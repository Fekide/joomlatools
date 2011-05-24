# -*- encoding: utf-8 -*-
require File.expand_path('../lib/jdt/version', __FILE__)

Gem::Specification.new do |s|
  s.add_development_dependency "nokogiri", ">= 1.4.4.1"
  s.add_development_dependency "thor", ">= 0.14.6"
  s.add_development_dependency "rspec", ">= 2.6.0"

  s.authors = ['Simon Harrer', 'Andreas Vorndran']
  s.description = %q{A command line tool for developing Joomla Extensions}
  s.email = 'simon.harrer@feki.de'
  s.executables = `git ls-files -- bin/*`.split("\n").map{|f| File.basename(f)}
  s.extra_rdoc_files = ['CHANGELOG.md', 'LICENSE', 'README.md']
  s.files = `git ls-files`.split("\n")
  s.homepage = 'http://github.com/simonharrer/joomlatools'
  s.name = 'jdt'
  s.rdoc_options = ['--charset=UTF-8']
  s.require_paths = ['lib']
  s.required_rubygems_version = Gem::Requirement.new('>= 1.3.6')
  s.summary = s.description
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.version = JDT_Module::VERSION
end