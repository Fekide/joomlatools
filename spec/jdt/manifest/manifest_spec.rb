require "rspec"
require "tmpdir"
require "ftools"

require "jdt/manifest/manifest"
require "jdt/manifest/attributes"

describe Jdt::Manifest do

  FILE = "#{File.dirname(__FILE__)}/data/library.xml"

  it "should read manifest file with correct attributes" do

    manifest = Jdt::Manifest.new(FILE)

    manifest.required_joomla_version.should eq("1.7.0")
    manifest.extension_method.should eq("upgrade")
    manifest.type.should eq("library")

    expect {
      manifest.type_short
    }.to raise_error(NoMethodError)

    expect {
      manifest.prefixed_name
    }.to raise_error(NoMethodError)
    
    manifest.name.should eq("activerecord")
    manifest.description.should eq("desc text")

    manifest.version.should eq("1.0.0")
    manifest.creation_date.should eq("August 2011")
    manifest.homepage.should eq("https://www.github.com/simonharrer/activerecord")
    manifest.author.should eq("Simon Harrer")
    manifest.author_email.should eq("simon.harrer@feki.de")
    manifest.author_url.should eq("http://www.feki.de")

    manifest.license.should eq("licsence text")
    manifest.copyright.should eq("copyright text")

    manifest.folder.should eq(File.dirname(FILE))
  end

  it "should bump version correctly" do

    Dir.tmpdir do |dir|
      MANIFEST_FILE = "#{dir}/manifest.xml"
      File.cp(FILE, MANIFEST_FILE)

      manifest = Jdt::Manifest.new(FILE)

      manifest.version.should eq("1.0.0")
      manifest.bump!(:patch)
      manifest.version.should eq("1.0.1")

      manifest.bump!(:minor)
      manifest.version.should eq("1.1.0")

      manifest.bump!(:patch)
      manifest.version.should eq("1.1.1")

      manifest.bump!(:major)
      manifest.version.should eq("2.0.0")
    end
    
  end
end