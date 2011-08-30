require "rspec"
require "tmpdir"


require "jdt/generator"

describe Jdt::LibraryGenerator do

  it "should do generate a library" do

    generator = Jdt::LibraryGenerator.new("test")
    generator.type.should eq("library")
    generator.type_short.should eq("lib")
    generator.name.should eq("test")
    generator.prefixed_name.should eq("lib_test")
    generator.folder.should eq("./lib_test")
    
    Dir.tmpdir do |dir|

      generator.location = dir
      generator.folder.should eq("#{dir}/lib_test")

      generator.generate

      File.exists?("#{dir}/lib_test/manifest.xml").should eq(true)
    end
    
  end
end

describe Jdt::ComponentGenerator do

  it "should generate a component" do
    
    generator = Jdt::ComponentGenerator.new("test")
    generator.type.should eq("component")
    generator.type_short.should eq("com")
    generator.name.should eq("test")
    generator.prefixed_name.should eq("com_test")
    generator.folder.should eq("./com_test")

    Dir.tmpdir do |dir|

      generator.location = dir
      generator.folder.should eq("#{dir}/com_test")

      generator.generate

      File.exists?("#{dir}/com_test/manifest.xml").should eq(true)
      File.directory?("#{dir}/com_test/site").should eq(true)
      File.directory?("#{dir}/com_test/admin").should eq(true)
    end
  end

end