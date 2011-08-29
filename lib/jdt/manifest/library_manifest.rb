require "nokogiri"

module Jdt
  class LibraryManifest < Manifest

    def type
      "library"
    end

    def type_short
      "lib"
    end

    def library_name
      @doc.xpath("//extension/libraryname").text
    end

    def semantics_valid?
      if(not super)
        return false
      end

      # SPECIFIC VALIDATIONS
    end

  end
end