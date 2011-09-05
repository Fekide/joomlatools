Feature: Status

  In order to know which extension with what version is currently edited
  As a CLI
  I want to obtain the name, type and version of the extension

  Scenario: Not within an extension
    Given the current directory is no extension directory
    When I run `jdt.bat status`
    Then the output should contain exactly "No manifest found\n"

  Scenario: Status success
    Given a file named "manifest.xml" with:
    """
<?xml version="1.0" encoding="UTF-8"?>
<extension type="library" version="1.7.0" method="upgrade">
  <name>activerecord</name>
  <version>1.0.0</version>
</extension>
      """
    When I run `jdt.bat status`
    Then the output should contain exactly "Extension lib_activerecord-v1.0.0\n"