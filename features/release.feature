Feature: release

  In order to obtain a deployable zip file of the extension
  I as a CLI

  @wip @announce
  Scenario: Success
    Given a file named "manifest.xml" with:
    """
<?xml version="1.0" encoding="UTF-8"?>
<extension type="library" version="1.7.0" method="upgrade">

  <name>activerecord</name>
  <version>0.0.1</version>

  <files>
    <filename>README</filename>
    <folder>lib</folder>
  </files>

</extension>
    """
    And a file named "README" with:
    """
    test
    """
    And an empty file named "CHANGELOG"
    And a directory named "lib"
    And an empty file named "lib/test.php"
    And a directory named "lib/subdir"
    And an empty file named "lib/subdir/test.php"
    And a directory named "zip" should not exist

    When I run `jdt.bat release`

    Then a directory named "zip" should exist
    And a file named "zip/lib_activerecord-v0.0.1.zip" should exist
    And a file named "README" should exist within a zip file "zip/lib_activerecord-v0.0.1.zip" with:
    """
    test
    """
    And a file named "CHANGELOG" should not exist within a zip file "zip/lib_activerecord-v0.0.1.zip"
    And a file named "lib/test.php" should exist within a zip file "zip/lib_activerecord-v0.0.1.zip"
    And a file named "lib/subdir/test.php" should exist within a zip file "zip/lib_activerecord-v0.0.1.zip"
    And a file named "index.html" should exist within a zip file "zip/lib_activerecord-v0.0.1.zip" with:
    """
    <html><body bgcolor="#FFFFFF"></body></html>
    """
    And a file named "lib/index.html" should exist within a zip file "zip/lib_activerecord-v0.0.1.zip" with:
    """
    <html><body bgcolor="#FFFFFF"></body></html>
    """
    And a file named "lib/subdir/index.html" should exist within a zip file "zip/lib_activerecord-v0.0.1.zip" with:
    """
    <html><body bgcolor="#FFFFFF"></body></html>
    """