require 'nokogiri'

class ExtensionFinder

  attr_accessor :path, :extension_path, :name, :type

  def initialize(path)
    @path = path
  end

  def find_extension_along_path()

    #iterate over all directories
    dir = path
    next_dir = '..'
    while File.expand_path(dir) != File.expand_path(next_dir) do
      next_dir = dir

      # has subfolder .jdt found





      possible_extension_path = File.expand_path("#{dir}#{File::SEPARATOR}#{File.basename(dir)}.xml")
      if(File.exists?(possible_extension_path))
        # file found
        f = File.open(possible_extension_path)

        # parse xml file
        begin
          doc = Nokogiri::Slop(f) { |config| config.strict }
          type = doc.extension["type"]
          name = doc.extension.name.content
        rescue Nokogiri::XML::SyntaxError => e
          puts "caught exception: #{e}"
        end

        f.close
      end

      dir = File.join dir, '..'
    end

  end

  def found?
    return name != ""
  end
end