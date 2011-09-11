require "jdt/cli/xampp/configure"
require "jdt/cli/xampp/install_joomla"
require "jdt/cli/xampp/path"
require "jdt/cli/xampp/php_ini"
require "jdt/cli/xampp/phpmyadmin"
require "jdt/cli/xampp/web"


module Jdt

  class Xampp < Thor
    def self.banner(task, namespace = true, subcommand = false)
      "#{basename} #{task.formatted_usage(self, true, subcommand)}"
    end
  end

  class CLI < Thor
    check_unknown_options!

    register Xampp, :xampp, "xampp <command>", "XAMPP cli"
  end

end