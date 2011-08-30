require 'zip/zip'

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

    def initialize(manifest)
      @manifest = manifest
    end

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
        File.delete(zip_file_name)
      end

      # ensure that directory exists
      dir = File.dirname(zip_file_name)
      if(not File.directory?(dir))
        Dir.mkdir(dir)
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
      "#{@manifest.folder}/zip"
    end

    def zip_file
      "#{zip_folder}/#{@manifest.prefixed_name_with_version}.zip"
    end

    def zip_file_with_timestamp
      "#{zip_folder}/#{@manifest.prefixed_name_with_version}_#{timestamp}.zip"
    end

    def timestamp
      Time.now.strftime("%Y%m%d%H%M%S%L")
    end

     def add_files_to_zip(zip)

      # add manifest
      add_manifest(zip)

      # add all referenced files and folders from manifest
      add_referenced(zip)

    end

    def add_manifest(zip)
      zip.add(File.basename(@manifest.file), @manifest.file)
    end

    def add_referenced(zip)
      @manifest.referenced.each do |ref|

        if (ref.file?)
          zip.add(ref.path_in_extension, ref.path_in_filesystem)
        elsif (ref.folder?)
          Dir["#{ref.path_in_filesystem}/**/*"].each do |f|
            if (File.file?(f))
              absolute_file = File.expand_path(f)
              relative_file = absolute_file[(@manifest.folder.length + 1) .. -1]
              zip.add(relative_file, absolute_file)
            end
          end
        end
      end
    end



  end

end