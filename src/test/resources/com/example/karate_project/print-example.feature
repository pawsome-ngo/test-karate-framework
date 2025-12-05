Feature: Demonstration of the print keyword

  Background:
    # Use the localBaseUrl we configured for your Spring Boot app
    * url localBaseUrl

  @local-print
  Scenario: Use print to display variables and the response
    # 1. Print the base configuration value (localBaseUrl is defined in karate-config.js)
    * print '>>> STARTING TEST: Hitting URL:', localBaseUrl

    # 2. Define a local variable using 'def'
    * def path = '/hello'
    * print '>>> DEFINED PATH:', path

    Given path path
    And param name = 'KarateUser'
    When method GET
    Then status 200

    # 3. Print the final response body received from your GreetingController
    * print '>>> FINAL RESPONSE JSON:', response

    # 4. Print a specific field from the response
    * print '>>> GREETING MESSAGE:', response.greeting

    And match response.greeting == 'Hello, KarateUser!'