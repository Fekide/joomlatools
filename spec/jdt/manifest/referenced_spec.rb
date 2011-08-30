require "rspec"
require "tmpdir"

require "jdt/manifest/referenced"

describe Jdt::Referenced do

  it "should reference file without parent" do

    Dir.tmpdir do |dir|

      file = "#{dir}/test.ext"
      File.open("#{dir}/test.ext") do |file|
        file << "test"
      end

      ref = Jdt::Referenced.new
      ref.type = :file
      ref.extension_path = dir
      ref.path = "test.ext"

      ref.exists?.should eq(true)
      ref.path_in_extension.should eq("test.ext")
      ref.path_in_filesystem.should eq("#{dir}/test.ext")
    end

  end
end