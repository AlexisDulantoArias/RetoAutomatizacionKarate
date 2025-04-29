@allListUsers
Feature: Listar usuarios - ServeRest

  Background:
    * url urlBase
    * configure ssl = true

  @listRegisteredUsers
  Scenario: Listar usuarios registrados
    Given path '/usuarios'
    When method get
    Then status 200
    And match response == '#object'
    And print response