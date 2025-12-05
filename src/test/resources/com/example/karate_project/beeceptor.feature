Feature: Beeceptor API Tests
As a QA engineer
I want to test the custom API endpoints on Beeceptor
So that I can ensure the mock server returns the correct data

  Background:
    * url baseUrl

  Scenario: Test the Hello Endpoint (GET)
    Given path '/api/hello'
    When method GET
    Then status 200
    And match response.message == '#string'

  Scenario: Create a new item (POST)
    Given path '/api/items'
    And request { name: 'Karate', type: 'Framework' }
    When method POST
    Then status 200
    And print 'The response was:', response