Feature: Status

  In order to know which extension with what version is currently edited
  As a CLI
  I want to obtain the name, type and version of the extension

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

  Scenario: Manifest found in directory named after itself with underscore
    Given a directory named "lib_test"
    And a file named "lib_test/test.xml" with:
    """
      <?xml version="1.0" encoding="UTF-8"?>
      <extension type="library" version="1.7.0" method="upgrade">
        <name>activerecord</name>
        <version>1.0.0</version>
      </extension>
      """
    And I cd to "lib_test"
    When I run `jdt.bat status`
    Then the output should contain exactly "Extension lib_activerecord-v1.0.0\n"

  Scenario: Manifest found in directory named after itself with underscore
    Given a directory named "test"
    And a file named "test/test.xml" with:
    """
      <?xml version="1.0" encoding="UTF-8"?>
      <extension type="library" version="1.7.0" method="upgrade">
        <name>activerecord</name>
        <version>1.0.0</version>
      </extension>
      """
    And I cd to "test"
    When I run `jdt.bat status`
    Then the output should contain exactly "Extension lib_activerecord-v1.0.0\n"

  Scenario: Manifest found in sub directory
    Given a directory named "lib_test/subdir"
    And a file named "lib_test/test.xml" with:
    """
      <?xml version="1.0" encoding="UTF-8"?>
      <extension type="library" version="1.7.0" method="upgrade">
        <name>activerecord</name>
        <version>1.0.0</version>
      </extension>
      """
    And I cd to "lib_test/subdir"
    When I run `jdt.bat status`
    Then the output should contain exactly "Extension lib_activerecord-v1.0.0\n"