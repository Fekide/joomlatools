require "launchy"
require "zip/zip"
require "open-uri"

module Jdt

  class Xampp < Thor
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


end