@allDeleteUser
Feature: Eliminar usuario - ServeRest

  Background:
    * url urlBase
    * path '/usuarios/'
    * configure ssl = true
    * def json = read('classpath:resources/request/registrerUser.json')
    * def randomId = Java.type('utils.TestDataGenerator').generateRandomUserId()
    * def randomIdError = Java.type('utils.TestDataGenerator').generateRandomUserIdError()

  @deleteUser
  Scenario: Eliminar usuario
    Given call read("../features/registerUser.feature@registerUser")
    And path userId
    When method delete
    Then status 200
    And match response.message == "Registro excluído com sucesso"
    And print response