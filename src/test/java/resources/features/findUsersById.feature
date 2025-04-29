@allFindUsersById
Feature: Buscar Usuarios por Id - ServeRest

  Background:
    * url urlBase
    * path '/usuarios/'
    * configure ssl = true
    * def json = read('classpath:resources/request/registrerUser.json')
    * def randomId = Java.type('utils.TestDataGenerator').generateRandomUserId()
    * def randomIdError = Java.type('utils.TestDataGenerator').generateRandomUserIdError()

  @findUserById
  Scenario: Buscar usuario por Id
    Given call read("../features/registerUser.feature@registerUser")
    And path userId
    When method get
    Then status 200
    And match response.administrador == '#regex true|false'
    And print response

  @findUserWithNotExistentId
  Scenario: Buscar usuario con Id no existente
    Given path randomId
    When method get
    Then status 400
    And match response.message == 'Usuário não encontrado'

  @findUserWithWrongLongId
  Scenario: Buscar usuario con Id con longitud incorrecta
    Given path randomIdError
    When method get
    Then status 400
    And match response.id == 'id deve ter exatamente 16 caracteres alfanuméricos'