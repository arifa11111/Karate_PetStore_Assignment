Feature: API testing of pet store

  Background:
    * url baseUrl
    * def jsonUpdatePayload = read('../utils/updatePet.json')

  Scenario: Get pet details by id

    Given path '/pet/'+ petId
    When method get
    Then status 200
    And match response == "#notnull"

  Scenario:  Update pet details with form-data

    Given path '/pet/'+ petId
    And form field status = 'sold'
    When method POST
    Then status 200
    Then match response contains { 'code':200 }

  Scenario:  Update existing pet details by id

    Given path '/pet/'
    And request jsonUpdatePayload
    When method PUT
    Then status 200
    Then match response.status == "Pending"



  Scenario:  Find pet details by tag

    Given path '/pet/findByTags'
    And param tags = 'Snake'
    When method get
    Then status 200

  Scenario: Find pet by status
    Given path '/pet/findByStatus'
    And param status = 'available'
    When method get
    Then status 200


  Scenario: Delete pet details by id

    Given path '/pet/'+ petId
    When method DELETE
    Then status 200









