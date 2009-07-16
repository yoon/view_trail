Feature: ViewTrail
  In order to audit requests made to my app
  I want to record the controller, action, params, and method
  
  Background:
    Given I current user is 312
    
  Scenario: GET request
    Given I have 0 activities
    When I get the foo page
    Then I should have 1 activities
    And the last activity should have "312" whodunnit
    And the last activity should have "foo" action
    And the last activity should have "foo" controller
    And the last activity should have "{}" params
    
  Scenario: POST request
    When I post the foo page
    Then I should have 2 activities
    And the last activity should have "312" whodunnit
    And the last activity should have "foo" action
      
  Scenario: PUT request
    Given I put the foo page
    Then I should have 3 activities
    And the last activity should have "312" whodunnit
    And the last activity should have "foo" action

  Scenario: DELETE request
    Given I delete the foo page
    Then I should have 4 activities
    And the last activity should have "312" whodunnit
    And the last activity should have "foo" action

