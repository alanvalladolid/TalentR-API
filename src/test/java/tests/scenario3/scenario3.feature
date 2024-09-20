Feature: Test the API's response to various invalid inputs when creating a user.

  Background:
    * url urlBase
    * def user = read ('requestUser.json')

  Scenario: Sends a POST request with valid name and job fields and validate that the user is successfully created
    Given path 'users'
    And request user
    When method post
    Then status 201
    And match responseHeaders['Content-Type'][0] contains 'application/json'

  Scenario Outline: Sends a POST request with multiple valid name and job
    * set user.name = '<name>'
    * set user.job = '<job>'

    Given path 'users'
    And request user
    When method post
    Then status 201
    And match responseHeaders['Content-Type'][0] contains 'application/json'

    Examples:
      | name   | job       |
      | Alan   | QA        |
      | Swetha | QA Lead   |
      | Darryl | Tech Lead |

  Scenario Outline: Sends a POST request without name
    * set user.name = '<name>'
    * set user.job = '<job>'

    Given path 'users'
    And request user
    When method post
    Then status 201
    And match responseHeaders['Content-Type'][0] contains 'application/json'

    Examples:
      | name | job |
      |      | QA  |

  Scenario Outline: Sends a POST request without job
    * set user.name = '<name>'
    * set user.job = '<job>'

    Given path 'users'
    And request user
    When method post
    Then status 201
    And match responseHeaders['Content-Type'][0] contains 'application/json'

    Examples:
      | name | job |
      | Alan |     |

  Scenario Outline: Sends a POST request with name invalid
    * set user.name = '<name>'
    * set user.job = '<job>'

    Given path 'users'
    And request user
    When method post
    Then status 201
    And match responseHeaders['Content-Type'][0] contains 'application/json'

    Examples:
      | name   | job       |
      | #$%&   | QA        |