Feature: Chained requests for user list and specific user

  Background:
    * url urlBase

  Scenario: Fetch a list of users and validate a specific user's details
    Given path 'users'
    When method get
    Then status 200
    And match response.data[*].id == '#[]'
    * def userList = response.data

    * def selectedUser = userList[0]
    * def userId = selectedUser.id

    Given path 'users', userId
    When method get
    Then status 200
    And match response.data.id == userId
    And match response.data.first_name == selectedUser.first_name
    And match response.data.last_name == selectedUser.last_name
    And match response.data.email == selectedUser.email
    And match response.data.avatar == '#string'
    And match response.data.avatar contains 'https://'
