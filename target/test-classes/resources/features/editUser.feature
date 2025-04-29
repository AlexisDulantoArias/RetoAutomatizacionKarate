@allEditUser
Feature: Actualizar usuario - ServeRest

  Background:
    * url urlBase
    * configure ssl = true
    * def json = read('classpath:resources/request/registrerUser.json')
    * def randomName = Java.type('utils.TestDataGenerator').generateRandomName()
    * def randomEmail = Java.type('utils.TestDataGenerator').generateRandomEmail()
    * def randomPassword = Java.type('utils.TestDataGenerator').generateRandomPassword()
    * def randomAdmin = Java.type('utils.TestDataGenerator').generateRandomAdministrator()
    * def randomId = Java.type('utils.TestDataGenerator').generateRandomUserId()

  @editUser
  Scenario: Actualizar usuario
    Given path '/usuarios/'
    And call read("../features/registerUser.feature@registerUser")
    And path userId
    * set json.nome = randomName
    * set json.email = randomEmail
    * set json.password = randomPassword
    * set json.administrador = randomAdmin
    And request json
    When method put
    Then status 200
    And match response.message == "Registro alterado com sucesso"

  @editUserWithoutId
  Scenario: Actualizar usuario con Id no existente
    Given path '/usuarios/'
    And path randomId
    * set json.nome = randomName
    * set json.email = randomEmail
    * set json.password = randomPassword
    * set json.administrador = randomAdmin
    And request json
    When method put
    Then status 201
    And match response.message == "Cadastro realizado com sucesso"

  @editUserWithRegisteredEmail
  Scenario: Actualizar usuario con correo ya registrado
    Given path '/usuarios/'
    And call read("../features/registerUser.feature@registerUser")
    And path userId
    * set json.nome = randomName
    * set json.email = "beltrano@qa.com.br"
    * set json.password = randomPassword
    * set json.administrador = randomAdmin
    And request json
    When method put
    Then status 400
    And match response.message == "Este email já está sendo usado"



