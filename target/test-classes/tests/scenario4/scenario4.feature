Feature: The /api/users endpoint returns paginated data, allowing clients to request different pages of users.

  Background:
    * url urlBase
    * def expectedResponse = read ('expectedResponse.json')

  Scenario: Sends a GET request to /api/users?page=2 and verifies the correct number of users is returned
    Given path 'users'
    And param page = 2
    When method get
    Then status 200
    And match response.per_page == 6
    And match response.data == '#[6]'
    And match response.page == expectedResponse.page
    And match response.per_page == expectedResponse.per_page
    And match response.total == expectedResponse.total
    And match response.total_pages == expectedResponse.total_pages
    And match responseHeaders['Content-Type'][0] contains 'application/json'

  Scenario: Sends a GET request and validate users on page 1 and page 2 are unique
    Given path 'users'
    And param page = 1
    When method get
    Then status 200
    And def usersPage1 = response.data

    Given path 'users'
    And param page = 2
    When method get
    Then status 200
    And def usersPage2 = response.data

    * def userIdsPage1 = karate.map(usersPage1, function(x){ return x.id })
    * def userIdsPage2 = karate.map(usersPage2, function(x){ return x.id })
    * match userIdsPage1 != userIdsPage2

  Scenario: Sends a GET request with non-existent page and verify response
    Given path 'users'
    And param page = 999
    When method get
    Then status 200
    And match response.page == 999
    And match response.data == []
    And match responseHeaders['Content-Type'][0] contains 'application/json'