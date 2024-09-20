Feature: Test pagination, ensuring user consistency and validating field structures across multiple pages of users.

  Background:
    * url urlBase

  Scenario: Validate pagination and user consistency across pages
    Given path 'users'
    And param page = 1
    When method get
    Then status 200
    And match response.per_page == 6
    And match response.data == '#[]'
    * def page1Users = response.data
    * def userIdsPage1 = karate.map(page1Users, function(x){ return x.id })

    And match each page1Users contains
    """
      {
        id: '#number',
        email: '#string',
        first_name: '#string',
        last_name: '#string',
        avatar: '#string'
      }
    """

    And match each page1Users[*].email != ''
    And match each page1Users[*].first_name != ''
    And match each page1Users[*].last_name != ''

    Given path 'users'
    And param page = 2
    When method get
    Then status 200
    And match response.per_page == 6
    And match response.data == '#[]'
    * def page2Users = response.data
    * def userIdsPage2 = karate.map(page2Users, function(x){ return x.id })

    And match each page2Users contains
    """
      {
        id: '#number',
        email: '#string',
        first_name: '#string',
        last_name: '#string',
        avatar: '#string'
      }
    """

    And match each page2Users[*].email != ''
    And match each page2Users[*].first_name != ''
    And match each page2Users[*].last_name != ''

    * match userIdsPage1 != userIdsPage2