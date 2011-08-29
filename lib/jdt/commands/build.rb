require 'thor'

module Jdt

  class CLI < Thor
    include Thor::Actions

    desc "build", "creates a zip stored under /zip with a timestamp"
    method_options :location => "."
    def build
      say "Build created at: #{Manifest.find(options[:location]).build}"
    end

    desc "release", "creates a zip stored under /zip"
    method_options :location => "."
    def release
      say "Release created at: #{Manifest.find(options[:location]).release}"
    end

  end

end
