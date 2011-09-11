require "mechanize"

module Jdt

  class CLI < Thor
    include Thor::Actions

    desc "deploy URL", "deploys the extension at a remote Joomla! reachable via URL"
    method_options :location => "."

    def deploy(url)
      handle_errors do
        manifest = Manifest.find(options[:location])

        # build
        zip_file = manifest.build

        homepage_url = url
        admin_url = "#{homepage_url}/administrator"
        installer_url = "#{admin_url}/index.php?option=com_installer"

        # get admin page
        agent = Mechanize.new
        joomla_admin_page = agent.get("#{admin_url}")

        # fill log in form
        login_form = joomla_admin_page.forms.first
        login_form.field_with(:name => "username").value = ask("Username:")
        login_form.field_with(:name => "passwd").value = ask("Password:")

        # log in
        logged_in_admin_page = agent.submit(login_form)
        # TODO provide feedback if login was successful

        # get installer page
        joomla_install_page = agent.get("#{installer_url}")

        # fill install form
        install_form = joomla_install_page.forms.first
        install_form.file_uploads.first.file_name = zip_file

        # install
        installed_feedback = agent.submit(install_form)

        # TODO provide feedback about installation
        puts installed_feedback.body
      end
    end


  end

end