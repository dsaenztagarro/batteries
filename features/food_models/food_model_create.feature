Feature: Create food model

  Background:
    Given I am a new, authenticated user
    And I create a new brand with properties:
      | Name | Hacendado |
    And I am on the food models page
    And I click "New Food model"
    And I should be on the new food model page

    Scenario: Create food model with valid attributes
      Given I fill the food model form with properties:
        | Name  | Peach Jam |
        | Brand | Hacendado |
      When I press "Create Food model"
      Then I should see "Show Food model"
      And I should see "Success! The Food model was create"

    Scenario: Create food model with invalid attributes
      Given I fill in "Name" with ""
      When I press "Create Food model"
      Then I should see "New Food model"
      And I should see "2 errors prohibited this food model from being saved"
