require "rspec"

require "jdt/manifest/schema_validator"

describe "ManifestSchemaValidator" do

  DATA_PATH = "#{File.dirname(__FILE__)}/data"

  it "should do validate against schemas" do

    files = ["#{DATA_PATH}/library_minimum.xml",
             "#{DATA_PATH}/library.xml"]

    files.each do |file|
      expect {
        Jdt::ManifestSchemaValidator.new(file).validate
      }.to_not raise_error(Jdt::BadManifestException)
    end
  end

  it "should not validate against schemas" do

    files = [#"#{DATA_PATH}/manifest.xml",
             "#{DATA_PATH}/library_error.xml"]

    files.each do |file|

      expect {
        Jdt::ManifestSchemaValidator.new(file).validate
      }.to raise_error(Jdt::BadManifestException)

    end
  end

end