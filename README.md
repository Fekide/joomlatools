# Abstract
The **Joomla Development Tool** (short: **jdt**) is a command line tool to easen the development of extensions for [Joomla! CMS](http://www.joomla.org/). It tries to bring the command line facilities of other famous web frameworks like [Rails](http://rubyonrails.org/) to [Joomla!](http://www.joomla.org/).

# Features

- `status` (shows the current extension type, name, version, author, etc.)
- `new TYPE NAME` (bootstraps a Joomla! extension, e.g. a component)
- `version`  (version of the JDT)
- `build` (creates zip file for deployment, with timestamp)
- `release` (creates zip file for deployment)
- `bump` (increments either --patch, --minor or --major version, --patch is default)

(NOT YET IMPLEMENTED)

- `clean` (removes the `/zip` and the `/.jdt` directories)
- `install` (installs the extension at a Joomla! instance)
- `uninstall` (uninstalls the extension from a Joomla! instance)
- `install-jdump` (installs JDump at a Joomla! instance)
- `uninstall-jdump` (uninstall JDump from a Joomla! instance)
- `sync` (copy the files to a local Joomla! installation, once or continously)
- `scaffold` (create models, controllers, views with default data)
- `test` (executes unit and integration tests)
- `xampp` (starts and stops xampp, open Joomla in browser)
- `open` (open the Extension in Browser)

# Are additional files being created within my extension?

Yes.

* `/zip` stores your deployable zip files of your extension
* `/.jdt` caches deployment information (NOT YET IMPLEMENTED)

However, these can be deleted by issuing the `jdt clean` command. (NOT YET IMPLEMENTED)

# Can I use it for Joomla 1.5 development?
No, only Joomla 1.6 development is supported. This is due to the change of the manifest structure.   

# Installation Instructions

(NOT YET IMPLEMENTED)

The installation is pretty simple. You need either [JRuby](http://www.jruby.org) oder [Ruby](http://www.ruby-lang.org). After that, you can easily install the JDT using the following command:

1. `gem install jdt`

The tool is then useable in the command line using `$> jdt`

# Development Instructions

Make sure that you have [RubyGems](https://rubygems.org/) 1.8.9 installed (gem update --system 1.8.9).

1. clone the repository

    `git clone https://www.github.com/simonharrer/joomlatools.git`

2. install the following gems: [ZenTest](https://github.com/seattlerb/zentest), [gem-release](https://github.com/svenfuchs/gem-release), [bundler](http://gembundler.com/)

    * `gem install ZenTest`
    * `gem install gem-release`
    * `gem install bundle`

3. `bundle` (installs all required gems defined by the gem specification)
4. `autotest` (to execute the tests, continously)

## Testing
Testing is done using cucumber with aruba for testing the command line interface.

### Acceptance and Integration Tests
The acceptance and integration tests are specified using the [`gherkin`](https://github.com/cucumber/cucumber/wiki/Gherkin) language and executed using [`cucumber`](https://github.com/cucumber/cucumber).
They are located within the `features` folder and can be executed using `cucumber features` from within the root directory of the JDT.

### Unit Tests
The unit tests are implemented using [`rspec`](https://github.com/rspec/rspec).
They are located within the `spec` folder and can be executed using `rspec spec` from within the root directory of the JDT.


## Technical Runtime Details

It is written with Ruby 1.8.7 ontop of several libraries:

* [`thor`](https://github.com/wycats/thor) to provide the command line commands
* [`nokogiri`](http://nokogiri.org/) to read the manifest xml file per Joomla! extension
* [`rubyzip`](http://rubyzip.sourceforge.net/) to create zip files as deployable artifacts

## Releasing

* make sure that everything is commited
* `gem bump` this increases the version number
* `gem release` this creates the gem and pushes it to [RubyGems](https://rubygems.org/)

## Installing locally

Make sure you have the gem `rake` and `gem-release` installed. Then execute `rake install` to install it locally. This automatically builds the gem and installs it over the current local installation of the gem.

# Joomla Versions
This tool solely supports **Joomla! 1.7**, as older versions do have much more ambiquity within their manifest.xml files.