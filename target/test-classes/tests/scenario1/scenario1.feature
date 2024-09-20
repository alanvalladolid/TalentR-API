Feature: Test both successful and failed login attempts and ensure the API handles missing fields appropriately.

  Background:
    * url urlBase
    * def credential = read ('credentials.json')
    * def error = read ('errors.json')

  Scenario Outline: Send a POST request with valid credentials
    * set credential.email = '<email>'
    * set credential.password = '<password>'

    Given path 'login'
    And request credential
    When method post
    Then status 200
    And match response.token == '#string'
    And match responseHeaders['Content-Type'][0] contains 'application/json'

    Examples:
      | email              | password   |
      | eve.holt@reqres.in | cityslicka |

  Scenario Outline: Sends a POST request with only the email
    * set credential.email = '<email>'
    * set credential.password = '<password>'

    Given path 'login'
    And request credential
    When method post
    Then status 400
    And match response.error == error.error01
    And match responseHeaders['Content-Type'][0] contains 'application/json'

    Examples:
      | email              | password |
      | eve.holt@reqres.in |          |

  Scenario Outline: Sends a POST request without email
    * set credential.email = '<email>'
    * set credential.password = '<password>'

    Given path 'login'
    And request credential
    When method post
    Then status 400
    And match response.error == error.error02
    And match responseHeaders['Content-Type'][0] contains 'application/json'

    Examples:
      | email | password   |
      |       | cityslicka |

  Scenario Outline: Sends a POST request with invalid email
    * set credential.email = '<email>'
    * set credential.password = '<password>'

    Given path 'login'
    And request credential
    When method post
    Then status 400
    And match response.error == error.error03
    And match responseHeaders['Content-Type'][0] contains 'application/json'

    Examples:
      | email             | password   |
      | eve.holtreqres.in | cityslicka |

  Scenario: Send a POST request with valid credentials and validate response time
    Given path 'login'
    And request credential
    When method post
    Then status 200
    And assert responseTime < 1000

  Scenario: Send a GET (invalid method) request with valid credentials
    Given path 'login'
    And request credential
    When method get
    Then status 404