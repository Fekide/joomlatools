<?php
if (!defined('PHP_VERSION_ID') || PHP_VERSION_ID < 50300)
    die('PHP ActiveRecord requires PHP 5.3 or higher');

define('PHP_ACTIVERECORD_VERSION_ID', '1.0');

require 'dist/lib/Singleton.php';
require 'dist/lib/Config.php';
require 'dist/lib/Utils.php';
require 'dist/lib/DateTime.php';
require 'dist/lib/Model.php';
require 'dist/lib/Table.php';
require 'dist/lib/ConnectionManager.php';
require 'dist/lib/Connection.php';
require 'dist/lib/SQLBuilder.php';
require 'dist/lib/Reflections.php';
require 'dist/lib/Inflector.php';
require 'dist/lib/CallBack.php';
require 'dist/lib/Exceptions.php';
require 'JoomlaConfig.php';

spl_autoload_register('activerecord_autoload');

function activerecord_autoload($class_name)
{
    // iterate over all directories and search within each of them
    $paths = ActiveRecord\JoomlaConfig::instance()->get_model_directories();

    foreach ($paths as $path) {
        $root = realpath(isset($path) ? $path : '.');

        if (($namespaces = ActiveRecord\get_namespaces($class_name))) {
            $class_name = array_pop($namespaces);
            $directories = array();

            foreach ($namespaces as $directory)
                $directories[] = $directory;

            $root .= DIRECTORY_SEPARATOR . implode($directories, DIRECTORY_SEPARATOR);
        }

        $file = "$root/$class_name.php";

        if (file_exists($file)) {
            require $file;

            // cancel function as file has been found
            return;
        }

    }


}

?>
