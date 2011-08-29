require 'zip/zip'
require 'zip/zipfilesystem'

module Jdt

  class Manifest
    
    def build
      ExtensionZipper.new(self).zip(:build)
    end

    def release
      ExtensionZipper.new(self).zip(:release)
    end

  end

  class ExtensionZipper

    attr_accessor :manifest

    def zip(type)

      if (type == :release)
        zip_file_name = zip_file
      elsif (type == :build)
        zip_file_name = zip_file_with_timestamp
      else
        raise ArgumentError("Type is not either :release or :build, but #{type}")
      end

      # ensure that the file does not exist
      if (File.exists?(zip_file_name))
        raise RuntimeError("zip file (#{zip_file}) already exists")
      end

      # create zip file
      Zip::ZipFile.open(zip_file_name, Zip::ZipFile::CREATE) do |zos|
        add_files_to_zip(zos)
      end

      # return zip file
      zip_file_name
    end

    private

    def zip_folder
      "#{manifest.folder}/zip"
    end

    def zip_file
      "#{zip_folder}/#{manifest.prefixed_name_with_version}.zip"
    end

    def zip_file_with_timestamp
      "#{zip_folder}/#{manifest.prefixed_name_with_version}_#{timestamp}.zip"
    end

    def timestamp
      Time.now.strftime("%Y%m%d%H%M%S%3N")
    end

    def add_files_to_zip(zip)
      # manifest
      zip.add(manifest.manifest)

      # all referenced files and folders
      manifest.referenced.each do |ref|
        if (ref.file?)
          add_file(zip, ref.full_path)
        elsif (ref.folder?)
          add_folder(zip, ref.full_path)
        end
      end
    end

    def add_file(zip, file)
      zip.add(file)
    end

    def add_folder(zip, folder)
      Dir["#{folder}/**/*"].each do |f|
        zip.add(f, f)
      end
    end
  end
end