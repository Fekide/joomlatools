require "rspec"

require "jdt/manifest/manifest"
require "jdt/manifest/library_manifest"
require "jdt/manifest/attributes"
require "jdt/manifest/build"
require "jdt/manifest/referenced"
require "jdt/manifest/find"
require "jdt/manifest/validation"

describe "Example Library Manifest" do

  PATH = "#{File.dirname(__FILE__)}/data/example_library"

  it "should validate" do
    manifest = Jdt::Manifest.find(PATH)
    manifest.file.should eq("#{PATH}/manifest.xml")
    manifest.valid?.should eq(true)

    manifest.referenced.empty?.should eq(false)
    manifest.referenced.count.should eq(4)

    manifest.build
    manifest.release
  end
  
end