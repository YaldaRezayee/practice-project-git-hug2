@EndToEnd
Feature: Automate end to end scenario

  Background: Generate Token
    Given url "https://tek-insurance-api.azurewebsites.net/"
    And path "/api/token"
    And request {"username": "supervisor","password": "tek_supervisor"}
    When method post
    Then status 200
    And print response
    * def createdToken = response.token

  Scenario: Creating new account and address, phone and car
    Given path "/api/accounts/add-primary-account"
    * def getData = Java.type('tiger.api.fakeData.review.FakeDataReview')
    * def email = getData.getEmail()
    * def name = getData.getName()
    * def lastName = getData.getLastName()
    * def title = getData.getTitle()
    * def dob = getData.getDob()
    * def phoneNumber = getData.getPhoneNumber()
    * def extension = getData.getPhoneExtension()
    * def stAddress = getData.getStreetAddress()
    * def city = getData.getCityName()
    * def state = getData.getStateName()
    * def zipCode = getData.getPostalCode()
    And request
      """
      {
        "email": "#(email)",
        "firstName": "#(name)",
        "lastName": "#(lastName)",
        "title": "#(title)",
        "gender": "FEMALE",
        "maritalStatus": "SINGLE",
        "employmentStatus": "employed",
        "dateOfBirth": "#(dob)",
        "new": true
      }
      """
    And header Authorization = "Bearer " + createdToken
    When method post
    Then status 201
    And print response
    * def dynamicId = response.id
    * def expectedResult = response.email
    #And print expectedResult 
    #Then assert expectedResult == "#(email)"
    # Adding phone number to the account
    And path "/api/accounts/add-account-phone"
    And param primaryPersonId = dynamicId
    And request
      """
      {
        "phoneNumber": "#(phoneNumber)",
        "phoneExtension": "#(extension)",
        "phoneTime": "Afternoon",
        "phoneType": "Mobile"
        }
      """
    And header Authorization = "Bearer " + createdToken
    When method post
    Then status 201
    And print response
    # Adding address to account
    And path "/api/accounts/add-account-address"
    And param primaryPersonId = dynamicId
    And request
      """
      {
        "addressType": "Home",
        "addressLine1": "#(stAddress)",
        "city": "#(city)",
        "state": "#(state)",
        "postalCode": "#(zibCode)",
        "current": true
        }
      """
    And header Authorization = "Bearer " + createdToken
    When method post
    Then status 201
    And print response
    #Adding car to account
    And path "/api/accounts/add-account-car"
    And param primaryPersonId = dynamicId
    And request
      """
      {
        "make": "Toyota",
        "model": "Corolla Cross",
        "year": "2022",
        "licensePlate": "VIP - 2222"
        }
      """
