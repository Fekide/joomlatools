require 'rubygems'
require 'nokogiri'
require 'mechanize'

HOMEPAGE = "http://127.0.0.1/joomla"
ADMIN = "#{HOMEPAGE}/administrator"
INSTALLER = "#{ADMIN}/index.php?option=com_installer"

agent = Mechanize.new

joomla_admin_page = agent.get("#{ADMIN}")

# puts joomla_admin_page.forms.first.inspect
login_form = joomla_admin_page.forms.first
login_form.field_with(:name => "username").value = "admin"
login_form.field_with(:name => "passwd").value = "spec"

logged_in_admin_page = agent.submit(login_form)
joomla_install_page = agent.get("#{INSTALLER}")

puts joomla_install_page.body

install_form = joomla_install_page.forms.first
puts install_form.inspect
puts install_form.file_uploads.first.file_name = "com_hello.zip"

installed_feedback = agent.submit(install_form)

pp installed_feedback
puts installed_feedback.body


# check if retrieved page exists
# check if retrieved page is joomla page
# check if correct form is presented
  # all required fields are available

# login and check if the log in worked
  # show error message in case of error

# submit install form
  # get output of installation and output it on the console
  # in case of error, mark it as such and give output





# uninstall


# sync locally
# module, plugin, template, library -> simple, only copy to directory
# component -> complex