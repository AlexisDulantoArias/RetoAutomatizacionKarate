@allRegisterUser
Feature: Registrar usuario - ServeRest

  Background:
    * url urlBase
    * configure ssl = true
    * def json = read('classpath:resources/request/registrerUser.json')
    * def randomName = Java.type('utils.TestDataGenerator').generateRandomName()
    * def randomEmail = Java.type('utils.TestDataGenerator').generateRandomEmail()
    * def randomPassword = Java.type('utils.TestDataGenerator').generateRandomPassword()
    * def randomAdmin = Java.type('utils.TestDataGenerator').generateRandomAdministrator()

  @registerUser
  Scenario: Registrar usuario correctamente
    Given path '/usuarios'
    And set json.nome = randomName
    And set json.email = randomEmail
    And set json.password = randomPassword
    And set json.administrador = randomAdmin
    And request json
    When method post
    Then status 201
    And print 'Response:', response
    And match response.message == 'Cadastro realizado com sucesso'
    * def userId = $._id

  @registerUserError
  Scenario: Registrar usuario con correo ya registrado
    Given path '/usuarios'
    And set json.nome = randomName
    And set json.email = 'beltrano@qa.com.br'
    And set json.password = randomPassword
    And set json.administrador = randomAdmin
    And request json
    When method post
    Then status 400
    And match response.message == 'Este email já está sendo usado'

  @registerUserWithoutName
  Scenario: Registrar usuario con campo nombre vacio
    Given path '/usuarios'
    And set json.nome = ''
    And set json.email = randomEmail
    And set json.password = randomPassword
    And set json.administrador = randomAdmin
    And request json
    When method post
    Then status 400
    And match response.nome == 'nome não pode ficar em branco'

  @registerUserWithoutEmail
  Scenario: Registrar usuario con campo email vacio
    Given path '/usuarios'
    And set json.nome = randomName
    And set json.email = ''
    And set json.password = randomPassword
    And set json.administrador = randomAdmin
    And request json
    When method post
    Then status 400
    And match response.email == 'email não pode ficar em branco'

  @registerUserWithoutPassword
  Scenario: Registrar usuario con campo password vacio
    Given path '/usuarios'
    And set json.nome = randomName
    And set json.email = randomEmail
    And set json.password = ''
    And set json.administrador = randomAdmin
    And request json
    When method post
    Then status 400
    And match response.password == 'password não pode ficar em branco'

  @registerUserWithoutAdmin
  Scenario: Registrar usuario con campo administrador vacio
    Given path '/usuarios'
    And set json.nome = randomName
    And set json.email = randomEmail
    And set json.password = randomPassword
    And set json.administrador = ''
    And request json
    When method post
    Then status 400
    And match response.administrador == "administrador deve ser 'true' ou 'false'"