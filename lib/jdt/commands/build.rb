require 'thor'

module Jdt

  class CLI < Thor
    include Thor::Actions

    desc "build", "creates a zip stored under /zip with a timestamp"
    method_options :location => "."

    def build
      handle_errors do
        say "Build created at: #{Manifest.find(options[:location]).build}"
      end
    end

    desc "release", "creates a zip stored under /zip"
    method_options :location => "."

    def release
      handle_errors do
        say "Release created at: #{Manifest.find(options[:location]).release}"
      end
    end

    desc "clean","removes the /zip directory"
    method_options :location => "."

    def clean
      handle_errors do
        Manifest.find(options[:location]).clean
        say "Everything is cleaned!"
      end
    end

  end

end