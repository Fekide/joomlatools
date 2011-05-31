require "thor"
require "helper/index_creater"

class JDT < Thor
  include Thor::Actions

  desc "create_index [path]", "creates in the folder and all subfolders index.html"
  def create_index (path)
    IndexCreater.new(path).create_index
  end
end