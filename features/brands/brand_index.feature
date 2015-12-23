Feature: Show brand list empty

  Scenario: A message notifies there are no brands
    Given I am a new, authenticated user
    When I click "Admin"
    And I click "Brand"
    Then I should see "Brand list"

