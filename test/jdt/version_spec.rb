require "rspec"
require "../../lib/jdt/version"

describe "JDT_Module" do

  it "should has correct version" do
    "0.0.1".should == JDT_Module::VERSION
  end

end

describe "JDT" do

  it "should output correct thing on console" do
    JDT.new.version
  end

end