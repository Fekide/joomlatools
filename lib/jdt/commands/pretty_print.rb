module Jdt

  class CLI < Thor

    desc "manifest","prints the contents of the manifest on the console"
    method_options :location => "."
    def manifest
      say Jdt::Manifest.find(options[:location]).to_xml
    end

  end

end