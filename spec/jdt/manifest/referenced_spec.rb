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

      ref = Jdt::Referenced.file_ref(file)
      ref.exists?.should eq(true)
    end

  end
end