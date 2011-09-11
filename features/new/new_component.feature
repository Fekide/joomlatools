Feature: new component

  Generation data specific for generation a component.

  @wip
  Scenario: Create new component with name test
    When I successfully run `jdt.bat new component test`
    Then the following directories should exist:
    # backend
      | com_test/admin                |
      | com_test/admin/views          |
      | com_test/admin/controllers    |
      | com_test/admin/models         |
      | com_test/admin/models/forms   |
      | com_test/admin/models/rules   |
      | com_test/admin/models/fields  |
      | com_test/admin/sql            |
      | com_test/admin/sql/updates    |
      | com_test/admin/helpers        |
      | com_test/admin/tables         |
      | com_test/admin/assets         |
      | com_test/admin/language/en-GB |
      # frontend
      | com_test/site                 |
      | com_test/site/views           |
      | com_test/site/controllers     |
      | com_test/site/models          |
      | com_test/site/assets          |
      | com_test/site/language        |
      | com_test/site/language/en-GB  |


    And the following files should exist:
      | com_test/admin/access.xml                            |
      | com_test/admin/config.xml                            |
      | com_test/admin/controller.php                        |
      | com_test/admin/com_test.php                          |
      | com_test/admin/language/en-GB/en-GB.tpl_test.ini     |
      | com_test/admin/language/en-GB/en-GB.tpl_test.sys.ini |
      | com_test/site/controller.php                         |
      | com_test/site/com_test.php                           |
      | com_test/site/language/en-GB/en-GB.tpl_test.ini      |
      | com_test/site/language/en-GB/en-GB.tpl_test.sys.ini  |