require "manifest"

class LibraryManifest < Manifest

  attr_accessor :library_name

  def type
    "library"
  end

  def type_short
    "lib"
  end

  def from_xml()
    super
    library_name = @doc.xpath("//extension/libraryname").text
  end

end