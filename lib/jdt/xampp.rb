require "thor"
require "thor/group"

require 'yaml'
require "launchy"

require "jdt/config"

require "tmpdir"
require "net/http"
require "zip/zip"
require "open-uri"

module Jdt

  class Xampp < Thor
    namespace :xampp

    desc "configure", "configure server settings"

    def configure
      # get xampp path
      xampp_path = ask("Enter fully qualified xampp path (default: C:\\xampp):")

      # set xampp path default value if it has not been set
      if (xampp_path == "")
        xampp_path = "c:\\xampp"
      end

      # store it
      XamppConfig.new.xampp_path = xampp_path
    end

    desc "php_ini", "show php.ini"
    def php_ini
      File.open("#{XamppConfig.new.xampp_path}/php/php.ini").each_line do |line|
        puts line
      end
    end

    desc "install_joomla", "install newest version of joomla"
    method_options :joomla_zip_location => "http://joomlacode.org/gf/download/frsrelease/15278/66555/Joomla_1.7.0-Stable-Full_Package.zip"
    method_options :joomla_path => "joomla"
    def install_joomla
      # setup paths
      joomla_path = options[:joomla_path]
      joomla_local_path = File.join(XamppConfig.new.htdocs_path, joomla_path)
      joomla_remote_path = "http://localhost/#{joomla_path}"
      joomla_zip_location = options[:joomla_zip_location]

      # download and unzip
      download_zip(joomla_zip_location, joomla_local_path)

      # open url
      Launchy.open(joomla_remote_path)
    end

    desc "path", "show path to xampp"
    def path
      puts "Path is #{XamppConfig.new.xampp_path}"
    end

    desc "phpmyadmin", "open phpmyadmin in browser"
    def phpmyadmin
      Launchy.open("http://localhost/phpMyAdmin")
    end

    desc "web", "open localhost in browser"
    def web
      link = "http://localhost/"
      Launchy.open(link)
    end

    def self.banner(task, namespace = true, subcommand = false)
      "#{basename} #{task.formatted_usage(self, true, subcommand)}"
    end

    no_tasks {
      def download_zip(source, target)
        open(source) do |zf|
          #zf is an instance of class Tempfile

          Zip::ZipFile.open(zf.path) do |zipfile|
            #zipfile.class is Zip::ZipFile

            zipfile.each do |e|
              #e is an instance of Zip::ZipEntry

              fpath = File.join(target, e.to_s)
              FileUtils.mkdir_p(File.dirname(fpath))

              #the block is for handling an existing file. returning true will overwrite the files.
              zipfile.extract(e, fpath) { true }
            end
          end
        end
      end
    }

  end

  class CLI < Thor
    check_unknown_options!

    register Xampp, :xampp, "xampp <command>", "XAMPP commands"
  end


end