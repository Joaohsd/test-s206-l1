Feature: Testing Resources from Cars API

  Background: Execute BEFORE EACH test
    * def base_url = "http://127.0.0.1:8000/"
    * def car_valid = read('car_valid.json')
    * def car_invalid = read('car_invalid.json')

  # Tests for cars
  Scenario: Testing GET all cars
    Given url base_url
    And path '/cars'
    When method get
    Then status 200
    And match $ == '#array'
    And match $[0] == '#object'
    And match $[0].name == '#present'

  Scenario: Testing GET one car with valid id
    Given url base_url
    And path '/cars/cc14a41c-e359-48e2-95bc-dd3654f50a0e'
    When method get
    Then status 200
    And match $.id == 'cc14a41c-e359-48e2-95bc-dd3654f50a0e'
    And match $.name == 'Tesla'
    And match $.is_parked == true

  Scenario: Testing GET one car with invalid id
    Given url base_url
    And path '/cars/unknown'
    When method get
    Then status 404

  Scenario: Testing POST one valid car
    Given url base_url
    And path '/cars/'
    When request car_valid
    When method post
    Then status 201
    And match $.id == '#present'
    And match $.name == 'Pajero TR4'
    And match $.is_parked == false
    And match $.parked_in == null

  Scenario: Testing POST one invalid car
    Given url base_url
    And path '/cars/'
    When request car_invalid
    When method post
    Then status 400
    And match $.parked_in == ["“01010101” is not a valid UUID."]

  # Tests for parking-lots
  Scenario: Testing GET all parking-lots
    Given url base_url
    And path '/parking-lots'
    When method get
    Then status 200
    And match $ == '#array'
    And match $[0] == '#object'
    And match $[0].name == '#present'

  Scenario: Testing GET one parking-lots with valid id
    Given url base_url
    And path '/parking-lots/f15cb208-1696-497e-abec-05bb4a2b639d'
    When method get
    Then status 200
    And match $.id == 'f15cb208-1696-497e-abec-05bb4a2b639d'
    And match $.name == 'Estacionamento Inatel'

  Scenario: Testing GET one parking-lots with invalid id
    Given url base_url
    And path '/parking-lots/unknown'
    When method get
    Then status 404