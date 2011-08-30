# Abstract
The Joomla Development Tool is a command line tool to easen the development of extensions for Joomla. 

# Features

- ```status``` (shows the current extension type, name, version, author, etc.)
- ```new TYPE NAME``` (bootstraps a Joomla! extension, e.g. a component)
- ```version```  (version of the JDT)
- ```build``` (creates zip file for deployment, with timestamp)
- ```release``` (creates zip file for deployment)

# Are additional files being created within my extension?
No, only a .jdt directory is created at the root of the extension in which configuration files, cached data, etc. is stored. This, however, can be removed using the jdt clean command.

# Can I use it for Joomla 1.5 development?
No, only Joomla 1.6 development is supported. This is due to the change of the manifest structure.   

# Installation Instructions

1. ```gem install jdt```

The tool is then useable in the command line using $> jdt

# Development Instructions

Make sure that you have RubyGems 1.8.9 installed (gem update --system 1.8.9).

1. clone the repository

    ```git clone https://www.github.com/simonharrer/joomlatools.git```

2. install the following gems: ZenTest, gem-release, bundle

    * ```gem install ZenTest```
    * ```gem install gem-release```
    * ```gem install bundle```

3. ```bundle```
4. ```autotest``` (to execute the tests)

## Releasing

* make sure that everything is commited
* ```gem bump```
* ```gem release```

## Installing locally

* ```rake install```

# Joomla Versions
This tool supports solely Joomla 1.7.
