require "rspec"

require "jdt/manifest/manifest"
require "jdt/manifest/validation"

describe Jdt::ManifestSchemaValidator do

  DATA_PATH = "#{File.dirname(__FILE__)}/data"

  it "should do validate against schemas" do

    files = ["#{DATA_PATH}/library_minimum.xml",
             "#{DATA_PATH}/library.xml"]

    files.each do |file|
      Jdt::ManifestSchemaValidator.new(file).valid?.should eq(true)
    end
  end

  it "should not validate against schemas" do

    files = ["#{DATA_PATH}/manifest.xml",
             "#{DATA_PATH}/library_error.xml"]

    files.each do |file|
      Jdt::ManifestSchemaValidator.new(file).valid?.should eq(false)
    end
  end

end