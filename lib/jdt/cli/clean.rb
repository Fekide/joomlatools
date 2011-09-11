module Jdt

  class CLI < Thor

    desc "clean", "Removes the ../zip, ../.jdt and ~/.jdt folder"
    method_options :global => true
    method_options :location => "."
    def clean
      handle_errors do

        if (options.global?)

        end


        # find manifest
        manifest = Manifest.find(options[:location])
        manifest.clean
      end
    end


  end


end