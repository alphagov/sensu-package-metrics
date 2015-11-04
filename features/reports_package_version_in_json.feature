Feature: Reports package version in json

  Scenario: ask to retrieve version of foobar
    Given a file named "dpkg.log" with:
    """
    2015-11-04 10:31:26 status installed foobar 1485
    """
    When I run `report-package-version -p foobar -l dpkg.log`
    Then the stdout should be JSON with:
      | package      | foobar    |
      | status       | installed |
      | version      | 1485        |
      | installed_at | 1446633086  |

  Scenario: ask for package not in log
    Given a file named "dpkg.log" with:
    """
    2015-11-04 10:31:26 status installed foobaz 1485
    """
    When I run `report-package-version -p foobar -l dpkg.log`
    Then the stdout should be JSON with:
      | package | foobar    |
      | status  | not_found |

  Scenario: ask for package appearing twice in log
    Given a file named "dpkg.log" with:
    """
    2015-11-04 10:31:26 status installed foobaz 1483
    2015-11-04 10:31:26 status installed foobaz 1485
    """
    When I run `report-package-version -p foobar -l dpkg.log`
    Then the stdout should be JSON with:
      | package | foobar    |
      | status  | not_found |
