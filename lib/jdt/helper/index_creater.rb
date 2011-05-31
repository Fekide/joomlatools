class IndexCreater
  def initialize (path)
    @path = path
  end

  private def create_index_recursive (path)
    template('/templates/component/index.erb',"#{path}/index.html")
    Dir.chdir("#{@path}") do
      Dir.glob("*").each do |dir|
        if File.directory?(dir)
          create_index_recursive("#{path}/#{dir}")
        end
      end
    end
  end

  public def create_index
    create_index_recursive(@path)
  end
end