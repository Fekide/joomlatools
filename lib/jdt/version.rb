require "thor"

module JDT_Module
  BUILD = 1
  MINOR = 0
  MAJOR = 0
  VERSION = [MAJOR,MINOR, BUILD].join(".")
end

class JDT < Thor
  include Thor::Actions

  desc "version","prints the current version of the JDT"
  def version()
    v = "#{JDT_Module::VERSION}"
    say(v)
  end

end