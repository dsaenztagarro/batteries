Feature: Create brand

  Background:
    Given I am a new, authenticated user
    And I am on the brands page
    And I click "New Brand"
    And I should be on the new brand page

    Scenario: Create brand with valid attributes
      Given I fill in "brand name" with "AA"
      When I press "Create Brand"
      Then I should see "Show Brand"
      And I should see "Success! The Brand was create"

    Scenario: Create brand with invalid attributes
      Given I fill in "brand name" with ""
      When I press "Create Brand"
      Then I should see "New Brand"
      And I should see "1 error prohibited this brand from being saved"
