Feature: API testing of store

  Background:
    * url baseUrl

  Scenario: CRUD operations for store

    Given path '/store/order/'+storeId
    And method GET
    Then status 200
    And match response contains {"quantity": 60,  "status": "shipped"}

  Scenario:  Delete details by id

    Given path '/store/order/'+storeId
    And method DELETE
    Then status 200

  Scenario: Returns pet inventories by status

    Given path '/store/inventory'
    And method GET
    Then status 200
    And match response contains
    """
    {
        'sold':'#ignore',
        "waiting":'#ignore',
        "alive":'#ignore',
        "pending":'#ignore',
        "available":'#ignore'
    }
    """