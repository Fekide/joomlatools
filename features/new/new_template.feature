Feature: new template

  Generation data specific for generation a template.

  @wip
  Scenario: Create new template with name test
    When I successfully run `jdt.bat new template test`
    Then the following directories should exist:
    # template folder
      | tpl_test/css            |
      | tpl_test/fonts          |
      | tpl_test/html           |
      | tpl_test/images         |
      | tpl_test/javascript     |
      | tpl_test/language       |
      | tpl_test/language/en-GB |

    And the following files should exist:
    # main entry file
      | tpl_test/component.php                         |
      | tpl_test/error.php                             |
      | tpl_test/offline.php                           |
      | tpl_test/favicon.ico                           |
      | tpl_test/index.php                             |

      | tpl_test/css/test.css                          |
      | tpl_test/css/print.css                         |

      | tpl_test/javascript/test.js                    |

      | tpl_test/html/modules.php                      |

      | tpl_test/language/en-GB/en-GB.tpl_test.ini     |
      | tpl_test/language/en-GB/en-GB.tpl_test.sys.ini |