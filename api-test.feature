Feature: API Testing

  Scenario: Get all menu items
    Given url baseUrl + '\menu'
    When method get
    Then status 200
    And match response == '#[[]]'

  Scenario: Filter menu items by ID
    Given url baseUrl + '\menu\1'
    When method get
    Then status 200
    And match response.id == 1

  Scenario: Add a new menu item
    Given url baseUrl + '\menu'
    And request { "name": "New Item", "price": 9.99 }
    When method post
    Then status 201
    And match response.name == 'New Item'

  Scenario: Validate response for a non-existing menu item
    Given url baseUrl + '\menu\999'
    When method get
    Then status 404
    And match response.message == 'Menu item not found'