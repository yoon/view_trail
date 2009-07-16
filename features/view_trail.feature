Feature: ViewTrail
  In order to audit requests made to my app
  I want to record the controller, action, params, and method
  
  Scenario: GET request
    Given I get the foo page
    Then I should have 1 activities

  Scenario: POST request
    Given I post the foo page
    Then I should have 2 activities
      
  Scenario: PUT request
    Given I put foo page
    Then I should have 3 activities

  Scenario: DELETE request
    Given I delete foo page
    Then I should have 4 activities

