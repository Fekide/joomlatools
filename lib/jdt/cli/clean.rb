module Jdt

  class CLI < Thor

    desc "clean", "Removes the ../zip, ../.jdt and ~/.jdt folder"
    method_options :global => true
    def clean

      if(options.global?)

      end


      handle_errors do
        # find manifest
        manifest = Manifest.find(options[:location])
        manifest.clean
      end
    end


  end


end