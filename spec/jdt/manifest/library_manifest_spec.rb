require "rspec"

require "jdt/manifest/manifest"
require "jdt/manifest/attributes"
require "jdt/manifest/library_manifest"

describe Jdt::LibraryManifest do

  it "should read additional values to Manifest" do
    manifest = Jdt::LibraryManifest.new("#{File.dirname(__FILE__)}/data/library.xml")
    manifest.library_name.should eq("activerecord")

    manifest.ext_type.should eq("library")
    manifest.ext_type_short.should eq("lib")
    manifest.prefixed_name.should eq("lib_activerecord")
  end
end