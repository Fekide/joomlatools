require "rspec"

require "jdt/manifest/manifests/manifest"

describe "Manifest" do

  it "should read manifest file with correct attributes" do

    FILE = "#{File.dirname(__FILE__)}/data/manifest.xml"

    manifest = Jdt::Manifest.new(FILE)

    manifest.required_joomla_version.should eq("1.7.0")
    # TODO more assertions

  end
end