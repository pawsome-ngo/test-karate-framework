Feature: Data Driven Testing Example

  Background:
    * url 'https://jsonplaceholder.typicode.com'

  @smoke
  Scenario Outline: Create posts with different data
    Given path '/posts'
    And request { title: '<title>', body: '<body>', userId: <userId> }
    When method POST
    Then status 201
    And match response.title == '<title>'
    And match response.id == '#present'

    Examples:
      | title          | body                 | userId |
      | First Post     | This is the content  | 1      |
      | Second Post    | Another content line | 5      |
      | Special Chars  | !@#$%^&*()           | 99     |