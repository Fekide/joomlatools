require "thor"

class JDT < Thor
  # include templates directory
  def self.source_root
    File.dirname(__FILE__)
  end
end