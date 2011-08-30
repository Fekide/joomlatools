require "nokogiri"

module Jdt
  class LibraryManifest < Manifest

    def type
      "library"
    end

    def ext_type_short
      "lib"
    end

    def library_name
      @doc.xpath("//extension/libraryname").text
    end

  end
end