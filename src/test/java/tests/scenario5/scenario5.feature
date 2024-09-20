Feature: Test the behavior of the API when trying to access a resource that does not exist.

  Background:
    * url urlBase

  Scenario: Sends a GET request to /api/users/23 and verifies that the response status is not found
    Given path 'users/23'
    When method get
    Then status 404
    And match response == {}

  Scenario: Sends a GET request with malformed user id (id 'abc')
    Given path 'users/abc'
    When method get
    Then status 404
    And match response == {}