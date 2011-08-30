# Joomla Library of PHP ActiveRecord

This project enwraps the PHP ActiveRecord 1.0 within a Joomla 1.7 Library for easy usage within the CMS Joomla!

## Usage

### Plain PHP ActiveRecord

If you want to use the plain ActiveRecord implementation, you have to import them using

    jimport('activerecord.ActiveRecord');

Then, you can use them directly by following the documentation of PHP ActiveRecord. 

### Enhanced PHP ActiveRecord (especially for Joomla!)

There are some additions and special constructs available for Joomla! components that easens the development. A list of them is stated below:

* ActiveRecord can automatically obtain the database credentials and configure itself using the standard Joomla! database
* Multiple model directories are supported so that every component, module, etc. can use the same ActiveRecord instance but different model locations to ensure encapsulation without performance issues. 

To load JoomlaActiveRecord in your Joomla Component, just leverage this line:

	jimport('activerecord.JoomlaActiveRecord');

Then, you can use the additional functionality within the configuration:

	ActiveRecord\JoomlaConfig::initialize(function($cfg){
	    // multiple directories are also supported
	    $cfg->set_model_directory(JPATH_COMPONENT_ADMINISTRATOR . '/domain/.');
	    $cfg->set_model_directory(JPATH_COMPONENT . '/domain/.');

	    // uses the database connection from the Joomla configuration
	    $cfg->set_joomla_connection('development');
	});
	
Please note: The configuration is a singleton. Thus, each plugin, module and component can initialize the configuration on its own and this will not result into a performance issue.

Additionally, you can call the function set_model_directory for every directory you want to add to the data mapper!

Notes:
* If you use namespaces, you can prevent a auto class loading issue.
*

## PHP ActiveRecord

PHP ActiveRecord is a PHP implementation of the famous ActiveRecord data pattern. More information can be found on the following links:

* The official homepage of PHP ActiveRecord: [[http://www.phpactiverecord.org/]]
* The github project of PHP ActiveRecord: [[https://github.com/kla/php-activerecord]]
* Explanation of the ActiveRecord pattern: [[http://en.wikipedia.org/wiki/Active_record_pattern]]