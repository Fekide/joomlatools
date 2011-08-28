require "rspec"
require "../lib/extension_finder"

describe ExtensionFinder do

  it "should find_extension" do

    cut = ExtensionFinder.new(".")
    cut.find_extension_along_path


    #To change this template use File | Settings | File Templates.
    true.should == false
  end
end