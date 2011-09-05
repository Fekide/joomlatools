require "aruba/api"
require "zip/zipfilesystem"


Given /^the current directory is no extension directory$/ do
  # do nothing, just use default directory
end

When /^a file named "([^"]*)" should exist within a zip file "([^"]*)"$/ do |file, zip|

  Zip::ZipFile.open(File.join(current_dir,zip)) do |zip_file|
    expect {
      zip_file.get_entry(file)
    }.to_not raise_error(Errno::ENOENT)
  end

end

When /^a file named "([^"]*)" should not exist within a zip file "([^"]*)"$/ do |file, zip|

  Zip::ZipFile.open(File.join(current_dir,zip)) do |zip_file|
    expect {
      zip_file.get_entry(file)
    }.to raise_error(Errno::ENOENT)
  end

end

When /^a file named "([^"]*)" should exist within a zip file "([^"]*)" with:$/ do |file, zip, file_content|

  Zip::ZipFile.open(File.join(current_dir,zip)) do |zip_file|
    expect {
      zip_file.read(file).should eq(file_content)
    }.to_not raise_error(Errno::ENOENT)
  end

end