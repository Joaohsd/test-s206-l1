Feature: Testing Resources from Rick and Morty API

  Background: Execute BEFORE EACH test
    * def base_url = "https://rickandmortyapi.com/api"

  # Tests for character
  Scenario: Testing GET a sample of characters
    Given url base_url
    And path '/character'
    When method get
    Then status 200
    And match $.info == '#object'
    And match $.info.count == 826
    And match $.results == '#[20]'

  Scenario: Testing GET one valid character
    Given url base_url
    And path '/character/1'
    When method get
    Then status 200
    And match $.id == 1
    And match $.name == 'Rick Sanchez'
    And match $.status == 'Alive'
    And match $.episode == '#array'

  Scenario: Testing GET one valid character and verifying its first episode
    Given url base_url
    And path '/character/1'
    When method get
    Then status 200
    And def episode = $.episode[0]
    And print episode
    And url episode
    When method GET
    Then status 200
    And match $.id == 1
    And match $.name == "Pilot"

  Scenario: Testing GET one invalid character passing valid id value
    Given url base_url
    And path '/character/827'
    When method get
    Then status 404
    And match $.error == 'Character not found'

  Scenario: Testing GET one invalid character passing invalid id value
    Given url base_url
    And path '/character/unknown'
    When method get
    Then status 500
    And match $.error == 'Hey! you must provide an id'
  #####################

  # Tests for episode
  Scenario: Testing GET a sample of episodes
    Given url base_url
    And path '/episode'
    When method get
    Then status 200
    And match $.info == '#object'
    And match $.info.count == 51
    And match $.results == '#[20]'

  Scenario: Testing GET one valid episode
    Given url base_url
    And path '/episode/1'
    When method get
    Then status 200
    And match $.id == 1
    And match $.name == 'Pilot'
    And match $.episode == 'S01E01'
    And match $.characters == '#array'

  Scenario: Testing GET one valid episode and verifying its first character
    Given url base_url
    And path '/episode/1'
    When method get
    Then status 200
    And def character = $.characters[0]
    And print character
    And url character
    When method GET
    Then status 200
    And match $.id == 1
    And match $.name == "Rick Sanchez"
    And match $.status == 'Alive'

  Scenario: Testing GET one invalid episode passing valid id value
    Given url base_url
    And path '/episode/52'
    When method get
    Then status 404
    And match $.error == 'Episode not found'

  Scenario: Testing GET one invalid episode passing invalid id value
    Given url base_url
    And path '/episode/unknown'
    When method get
    Then status 500
    And match $.error == 'Hey! you must provide an id'
  #####################

  # Tests for location
  Scenario: Testing GET a sample of locations
    Given url base_url
    And path '/location'
    When method get
    Then status 200
    And match $.info == '#object'
    And match $.info.count == 126
    And match $.results == '#[20]'

  Scenario: Testing GET one valid location
    Given url base_url
    And path '/location/1'
    When method get
    Then status 200
    And match $.id == 1
    And match $.name == 'Earth (C-137)'
    And match $.type == 'Planet'
    And match $.residents == '#array'

  Scenario: Testing GET one valid location and verifying its first resident
    Given url base_url
    And path '/location/1'
    When method get
    Then status 200
    And def residents = $.residents[0]
    And print residents
    And url residents
    When method GET
    Then status 200
    And match $.id == 38
    And match $.name == "Beth Smith"
    And match $.status == 'Alive'

  Scenario: Testing GET one invalid location passing valid id value
    Given url base_url
    And path '/location/127'
    When method get
    Then status 404
    And match $.error == 'Location not found'

  Scenario: Testing GET one invalid location passing invalid id value
    Given url base_url
    And path '/location/unknown'
    When method get
    Then status 500
    And match $.error == 'Hey! you must provide an id'