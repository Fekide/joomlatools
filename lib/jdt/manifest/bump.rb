require "nokogiri"

module Jdt

  class Manifest

    def bump!(type)
      new_version = bump_version(type, version)
      @doc.at_css("extension > version").content = new_version
      update_file_with_doc
    end

    private

    def update_file_with_doc
      File.open(file,"w") do |f|
        f.write(@doc.to_xml)
      end
    end

    def bump_version(type, version)
      new_version = version.split(".").map { |item| item.to_i }
      if (type == :patch)
        new_version[2] = new_version[2] + 1
      elsif (type == :minor)
        new_version[1] = new_version[1] + 1
        new_version[2] = 0
      elsif (type == :major)
        new_version[0] = new_version[0] + 1
        new_version[1] = 0
        new_version[2] = 0
      else
        raise RuntimeError("given type (#{type})not found")
      end
      new_version.join(".")
    end

  end

end