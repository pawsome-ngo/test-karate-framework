Feature: Test the Local Greeting Controller
As a tester
I want to verify the Spring Boot /hello endpoint

  Background:
    # CHANGE: Use localBaseUrl to hit the server running in the background
    * url localBaseUrl
    # --- NEW LINES HERE ---
    * print 'Current Username:', username
    * print '========================================'
  # ----------------------

  @smoke
  Scenario: Get default greeting
    Given path '/hello'
    When method GET
    Then status 200
    And match response.greeting == 'Hello, World!'

  Scenario: Get a specific greeting
    Given path '/hello'
    And param name = 'LocalKarate'
    When method GET
    Then status 200
    And match response.greeting == 'Hello, LocalKarate!'

    * print ' Printing the current user ', username