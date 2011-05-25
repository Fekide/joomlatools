require "thor"
require "nokogiri"

class TEST < Thor
  include Thor::Actions

  start
  desc "index [Path]", "testing"
  def index(path)
    #template('/templates/component/index.erb',"#{path}/index.html")
    Dir.chdir("#{path}") do
      # create an empty file for testing because template does not run
      File.open("index.html", 'w')
      directory = Dir.glob("*")
      while !directory.eql?([])
        value = directory.shift
        if File.directory?(value)
          index("#{path}/#{value}")
        end
      end
    end
  end
end