require "rspec"
require "tmpdir"


require "jdt/generator"

describe Jdt::LibraryGenerator do

  it "should do generate a library" do

    generator = Jdt::LibraryGenerator.new


    Dir.tmpdir do |dir|

      generator.generate("test")
      generator.type.should eq("library")
      generator.type_short.should eq("lib")
      generator.name.should eq("test")
      generator.prefixed_name.should eq("lib_test")
      generator.folder.should eq("./lib_test")
      generator.location = dir
      generator.folder.should eq("#{dir}/lib_test")

      File.exists?("#{dir}/lib_test/manifest.xml").should eq(true)
    end

  end
end