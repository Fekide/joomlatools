module Jdt

  class Manifest

    def referenced

      list = []

      # add files and media
      @doc.css("files","media").each do |files|

        parent_folder = files['folder']

        files.css("filename").each do |file|
          list << create_file_ref(file.text,parent_folder)
        end

        files.css("folder").each do |file|
          list << create_folder_ref(file.text,parent_folder)
        end

      end

      # scriptfile
      @doc.css("scriptfile").each do |file|
        list << create_file_ref(file.text)
      end

      return list
    end

    private

    def create_file_ref(path, parent_folder = nil)
      ref = Referenced.new
      ref.path = path
      ref.parent_folder = parent_folder
      ref.type = :file
      ref.extension_path = folder

      return ref
    end

    def create_folder_ref(path, parent_folder = nil)
      ref = Referenced.new
      ref.path = path
      ref.parent_folder = parent_folder
      ref.type = :folder
      ref.extension_path = folder

      return ref
    end

  end

  class Referenced
    
    attr_accessor :parent_folder, :path, :type, :extension_path

    def path_in_filesystem
      "#{extension_path}/#{path_in_extension}"
    end

    def path_in_extension
      if (parent_folder and parent_folder != "")
        "#{parent_folder}/#{path}"
      else
        "#{path}"
      end
    end

    def file?
      type == :file
    end

    def folder?
      type == :folder
    end

    def exists?
      if (file?)
        File.exists?(path_in_filesystem)
      elsif (folder?)
        Dir.exists?(path_in_filesystem)
      else
        raise RuntimeError("Neither file nor folder.")
      end
    end

    def to_s
      "Reference to #{type} #{path_in_extension}"
    end

  end

end