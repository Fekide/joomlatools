# Abstract
The **Joomla Development Tool** (short: **jdt**) is a command line tool to easen the development of extensions for [Joomla! CMS](http://www.joomla.org/). It tries to bring the command line facilities of other famous web frameworks like [Rails](http://rubyonrails.org/) to [Joomla!](http://www.joomla.org/).

And it really IS cool!

# Features

- `status` (shows the current extension type, name, version, author, etc.)
- `new <commands>` (bootstraps a Joomla! extension, e.g. a component)
    - `component NAME` (bootstraps a component)
    - `module NAME` (bootstraps a module)
    - `plugin NAME` (bootstraps a plugin)
    - `library NAME` (bootstraps a library)
    - `template NAME` (bootstraps a template)
    - `language NAME` (bootstraps a language)
    - `package NAME` (bootstraps a package)
- `version`  (version of the JDT)
- `build` (creates zip file for deployment, with timestamp)
- `release` (creates zip file for deployment)
- `bump` (increments either --patch, --minor or --major version, --patch is default)
- `clean` (removes the `/zip` and the `/.jdt` directories)
- `deploy` (installs the extension via web at an active Joomla! instance)
- `undeploy` (removes the extension via weg from an active Joomla! instance)
- `xampp <commands>` (xampp specific functionality with several subcommands)
    - `web` (open the Extension in Browser)
    - `phpMyAdmin` (opens phpMyAdmin in Browser)
    - `php_ini` (shows php.ini on console)

(NOT YET IMPLEMENTED)

- `generate` (create models, controllers, views with default data)
    - `controller` (create controller)
    - `model` (create model)
    - `view` (create view)
    - `language` (create language files)
    - `scaffold` (create controllers, models and views)
- `install-jdump` (installs JDump at a Joomla! instance)
- `uninstall-jdump` (uninstall JDump from a Joomla! instance)
- `sync` (copy the files to a local Joomla! installation, once or continously)
- `test` (executes unit and integration tests)

# FAQ

## Are additional files being created within my extension?

Yes.

* `/zip` stores your deployable zip files of your extension
* `~/.jdt/config.yml` caches global information like xampp und Joomla! installations
* `/.jdt/config.yml` caches project specific information like usernames and passwords

However, these can be deleted by issuing the `jdt clean` command.

## Can I use it for Joomla 1.5 or 1.6 development?
This tool solely supports **Joomla! 1.7**, as older versions do have much more ambiquity within their manifest.xml files.

## Why the heck did you use Ruby instead of PHP?
This is a good question. A very good one.

PHP is the language that is used by Joomla! and well suited for web applications. Ruby, however, has quite some library support for command line tooling, xml processing, automation etc. Thus, Ruby and its ecosystem provides a high abstraction level to create command line tools which is implemented here. 

# Installation Instructions

The installation is pretty simple. You need a running Ruby implementation. It is recommended to use the standard implementation [Ruby](http://www.ruby-lang.org). After that, you can easily install the **JDT** using the following command:

1. `gem install jdt`

The tool is then useable in the command line with `$> jdt`

# Development Instructions

## Prerequisites

* [Ruby 1.9.3](http://www.ruby-lang.org)
* [RubyGems](https://rubygems.org/) newest version installed with (`gem update --system`)

## Source code

The source code is solely available via [github](http://github.com)

    git clone https://www.github.com/simonharrer/joomlatools.git

## Required gems for development in general (making life easier)

Install the following gems: [ZenTest](https://github.com/seattlerb/zentest), [gem-release](https://github.com/svenfuchs/gem-release), [bundler](http://gembundler.com/)

  * `gem install ZenTest`
  * `gem install gem-release`
  * `gem install bundle`

## Required gems for JDT development

Execute `bundle` (installs all required gems defined by the gem specification)

**NOT WORKING UNDER WINDOWS!**

Solution:

 * Download and extract [DevKit](http://rubyinstaller.org/downloads/) to an arbitrary folder
 * Open `devkit_folder/msys.bat`
 * Change the directory to the JDT directory
 * Execute `bundle` which builds the native code for your system

## Installing locally

1. clone the repository

    `git clone https://www.github.com/simonharrer/joomlatools.git`

2. install the following gems: [gem-release](https://github.com/svenfuchs/gem-release), [bundler](http://gembundler.com/)

    * `gem install bundle`

3. Execute `bundle install` to install all dependent gems

3. Execute `rake install` to install the jdt locally

4. Use the tool with `$> jdt COMMAND`

## Testing

### Acceptance and Integration Tests
The acceptance and integration tests are specified using the [`gherkin`](https://github.com/cucumber/cucumber/wiki/Gherkin) language and executed using [`cucumber`](https://github.com/cucumber/cucumber).

They are located within the `features` folder and can be executed using `bundle exec cucumber features` from within the root directory of the JDT.

The tests are written to only work in specific cases:

* the gem has to be installed locally using `rake install` from within the JDT directory
* the tests only work using Windows. If you have a posix system, it would work if you simply replace all jdt.bat with jdt.

Best practices

* Execute only subsets of tests
    * Mark scenarios or features which are currently worked on with @wip (work in progress)
    * Execute `bundle exec cucumber features --tags @wip`

* For having color on windows:
    * Download [this file](https://github.com/aslakhellesoy/wac/blob/master/wac.exe)
    * Copy it into the bin directory of your Ruby installation
    * Add these to the normal execution to have colors `--color | wac`
    * Execute `bundle exec cucumber features --color | wac`


### Unit Tests
The unit tests are implemented using [`rspec`](https://github.com/rspec/rspec).

They are located within the `spec` folder and can be executed using `rspec spec` from within the root directory of the JDT.

### Autotest

The tests can automatically be executed using `autotest`. This tool detects when files change and automatically reexecutes only the tests relevant to the file change.

To cancel it, you have to press `CTRL + C` **twice**! By pressing `CTRL + C` **once**, **all** tests will be reexecuted.

TODO: does this work with cucumber as well?

## Technical Runtime Details

It is written with Ruby 1.9.2 ontop of several libraries:

* [`thor`](https://github.com/wycats/thor) to provide the command line commands
* [`nokogiri`](http://nokogiri.org/) to read the manifest xml file per Joomla! extension
* [`rubyzip`](http://rubyzip.sourceforge.net/) to create zip files as deployable artifacts
* [`mechanize`](https://github.com/tenderlove/mechanize) to deploy extensions to Joomla! systems via web
* [`launchy`](https://github.com/copiousfreetime/launchy) to open the browser at specific pages

## Releasing

* make sure that everything is commited
* `gem bump` this increases the version number
* `gem release` this creates the gem and pushes it to [RubyGems](https://rubygems.org/)
