require "rspec"
require "tmpdir"

require "jdt/manifest/finder"

describe "ManifestFinder" do

  it "should find manifest.xml in folder" do

    Dir.tmpdir() do |testdir|

      path = "#{testdir}/com_name"
      manifest_path = "#{path}/manifest.xml"
      Dir.mkdir(path)
      File.new(manifest_path)

      manifest = ManifestFinder.new(path).load
      manifest.should eq_a(Manifest)

      manifest.path.should eq(manifest_path)
    end

  end

  it "should find manifest with same name as folder in folder" do

    Dir.tmpdir() do |testdir|

      path = "#{testdir}/com_name"
      manifest_path = "#{path}/name.xml"
      Dir.mkdir(path)
      File.new(manifest_path)

      manifest = ManifestFinder.new(path).load
      manifest.should eq_a(Manifest)

      manifest.path.should eq(manifest_path)
    end

  end

  it "should not find manifest in empty folder" do

    Dir.tmpdir() do |testdir|

      path = "#{testdir}/com_name"
      Dir.mkdir(path)

      expect {
          ManifestFinder.new(path).load
      }.to raise_error(NoManifestException)

    end

  end

end