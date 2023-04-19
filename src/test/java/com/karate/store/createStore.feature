@ignore
Feature: API testing of store

  Background:
    * url baseUrl
    * def storeData = read("../utils/store.json")

  Scenario: CRUD operations for store

    #create store details
    Given path '/store/order'
    And request storeData
    And method POST
    Then status 200

    * def id = response.id