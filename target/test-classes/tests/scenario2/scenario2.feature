Feature: Validate the data structure and specific content of the response

  Background:
    * url urlBase
    * def expectedResponse = read ('expectedResponse.json')

  Scenario: Sends a GET request to /api/users/2 and verifies that the response includes the expected fields anda data format
    Given path 'users/2'
    When method get
    Then status 200
    And match response == expectedResponse
    And match responseHeaders['Content-Type'][0] contains 'application/json'

  Scenario: Sends a GET request to /api/users/2 with  Invalid header
    Given path 'users/2'
    And header Custom-Header = 'InvalidValue'
    When method get
    Then status 400
    And match response.message == 'Invalid header format'