require "rspec"
require "tmpdir"

require "jdt/manifest/manifest"
require "jdt/manifest/secure"

describe Jdt::IndexCreater do

  it "should create index.html files within a given path" do
    Dir.tmpdir do |dir|
      subdir = "#{dir}/subdir"
      Dir.mkdir(subdir)

      IndexCreater.new(dir).create_index

      File.exist?("#{dir}/index.html").should eq(true)
      File.read("#{dir}/index.html").should eq('<html><body bgcolor="#FFFFFF"></body></html>')
      File.exist?("#{subdir}/index.html").should eq(true)
      File.read("#{subdir}/index.html").should eq('<html><body bgcolor="#FFFFFF"></body></html>')
    end
  end

  it "should create index.html files within a given path by overriding existing index.html files" do
    Dir.tmpdir do |dir|
      subdir = "#{dir}/subdir"
      Dir.mkdir(subdir)

      File.open("#{subdir}") do |file|
        file << '<html><body bgcolor="#FFFFFF"></body></html>'
      end

      IndexCreater.new(dir).create_index

      File.exist?("#{dir}/index.html").should eq(true)
      File.read("#{dir}/index.html").should eq('<html><body bgcolor="#FFFFFF"></body></html>')
      File.exist?("#{subdir}/index.html").should eq(true)
      File.read("#{subdir}/index.html").should eq('<html><body bgcolor="#FFFFFF"></body></html>')
    end
  end


end