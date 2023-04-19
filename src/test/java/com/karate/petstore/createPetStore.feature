@ignore
Feature: API testing of creating pet store

  Background:
    * url baseUrl
    * def jsonPayload = read('../utils/data.json')

  Scenario: Create a pet-store

    #create
    Given path '/pet/'
    And request jsonPayload
    When method POST
    Then status 200
    Then match response.name == "sneaky"

    * def id = response.id