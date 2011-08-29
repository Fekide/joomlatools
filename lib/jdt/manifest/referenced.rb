module Jdt

  class Referenced
    
    attr_accessor :parent_folder, :path, :type

    def self.file_ref(path, parent_folder = nil)
      ref = Referenced.new
      ref.path = path
      ref.parent_folder = parent_folder
      ref.type = :manifest
      return ref
    end

    def self.folder_ref(path, parent_folder = nil)
      ref = Referenced.new
      ref.path = path
      ref.parent_folder = parent_folder
      ref.type = :folder
      return ref
    end

    def full_path
      if (parent_folder and parent_folder != "")
        "#{parent_folder}/#{path}"
      else
        "#{path}"
      end
    end

    def file?
      type == :manifest
    end

    def folder?
      type == :folder
    end

    def exists?
      if (file?)
        File.exists?(full_path)
      elsif (folder?)
        Dir.exists?(full_path)
      end

    end
  end

end