require "aruba"

ENV['PATH'] = "#{File.expand_path(File.dirname(__FILE__) + '/../../bin')}#{File::PATH_SEPARATOR}#{ENV['PATH']}"

Before do
  @aruba_timeout_seconds = 20
end