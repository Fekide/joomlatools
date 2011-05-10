require "rspec"
require "../lib/joomla_tools.thor"

describe JoomlaTools do

  it "status" do

    JoomlaTools.new.status

    #To change this template use File | Settings | File Templates.
    true.should == false
  end

end