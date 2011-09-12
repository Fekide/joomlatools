Feature: Manifest

  Scenario: Success
    Given a file named "manifest.xml" with:
      """
      <?xml version="1.0" encoding="UTF-8"?>
      
      <extension type="library" version="1.7.0" method="upgrade">
          <name>activerecord</name>

        <version>1.0.0</version>
      </extension>
      """
    When I run `jdt.bat manifest`
    Then the output should contain exactly:
      """
      <?xml version="1.0" encoding="UTF-8"?>
      <extension type="library" version="1.7.0" method="upgrade">
        <name>activerecord</name>
        <version>1.0.0</version>
      </extension>

      """