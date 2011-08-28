require "thor"

module Jdt

  class IndexCreater
    include Thor::Actions

    def initialize (path)
      @path = path
    end

    def create_index
      create_index_recursive(@path)
    end

    private

    def create_index_recursive (path)
      template('/templates/component/index.erb', "#{path}/index.html")
      Dir.chdir("#{path}") do
        Dir.glob("*").each do |dir|
          if File.directory?(dir)
            create_index_recursive("#{path}/#{dir}")
          end
        end
      end
    end

  end

end