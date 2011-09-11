module Jdt

  class CLI < Thor
    include Thor::Actions

    desc "bump", "bumps version incrementing the patch version counter (major.minor.patch)"
    method_options :major => false
    method_options :minor => false
    method_options :location => "."

    def bump
      handle_errors do
        # find manifest
        manifest = Manifest.find(options[:location])

        # determine what is to be bumped
        if (options.major?)
          bump_option = :major
        elsif (options.minor?)
          bump_option = :minor
        else
          bump_option = :patch
        end

        # bump
        manifest.bump!(bump_option)

        # inform user
        say "Bumped version to #{manifest.version} (bumped #{bump_option.to_s})"
      end
    end

  end

end