require "rspec"
require "../lib/version"

describe "JDT" do

  it "should has correct version" do
    "0.0.1".should == JDT::VERSION
  end
end