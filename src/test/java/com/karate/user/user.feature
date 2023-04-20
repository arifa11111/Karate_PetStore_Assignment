Feature: API testing of user

  Background:
    * url baseUrl
    * def password = newPwd
    * def jsonPayload = read('../utils/user.json')

  Scenario: Create User

    Given path '/user'
    And request jsonPayload[0]
    When method POST
    Then status 200

   Scenario: Login user

    Given path '/user/login'
    And params {'username':jsonPayload[0].username,"password":jsonPayload[0].password}
    When method GET
    Then status 200
    Then match response.message contains "logged in"

  Scenario: Get user details by username

    Given path '/user/'+jsonPayload[0].username
    When method GET
    Then status 200
    And match response.username == 'Arifa11111'


  Scenario:  Update user details by username

    Given path '/user/'+jsonPayload[0].username
    And request
     """
      {
        "id": 1111,
        "username": "Arifa11111",
        "firstName":"Arifa",
        "lastName": "Shaikh",
        "email": "shaikarifa.asha@gmail.com",
        "password": #(password),
        "phone": 9966647380,
        "userStatus": 1
      }
     """
    When method PUT
    Then status 200

  Scenario: Logout
    Given path '/user/logout'
    When method GET
    Then status 200

  Scenario: Delete user  by username

    Given path '/user/'+jsonPayload[0].username
    When method DELETE
    Then status 200

  Scenario Outline: Create multiple users

    Given path '/user/'+<path>
    And request jsonPayload
    When method POST
    Then status 200

    Examples:
      | path              |
      | "createWithArray" |
      | "createWithList"  |

