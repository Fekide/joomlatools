require "rspec"
require "../lib/status.thor"

describe JoomlaTools do

  it "status" do

    JoomlaTools.new.status

    #To change this template use File | Settings | File Templates.
    true.should == false
  end

end