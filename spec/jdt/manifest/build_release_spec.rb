require "rspec"
require "rspec/mocks"
require "jdt/manifest/build_release"

describe Jdt::ExtensionZipper do

  it "should include index.html in zip files" do

    zipper = Jdt::ExtensionZipper.new(nil)
    zipper.should be_a(Jdt::ExtensionZipper)
    zipper.should respond_to(:add_index_html_to_every_dir)
    
    zos = double("Zip")
    zos.stub(:each) do |block|
      puts "called"
      block.call "test/"
      block.call "test/x.php"
      block.call "test/lib/"
    end
    zos.stub(:add) do |f, s|
      puts "#{f} #{s}"
    end

    expect {
      zipper.add_index_html_to_every_dir(zos)
    }.to_not raise_error
  end
end