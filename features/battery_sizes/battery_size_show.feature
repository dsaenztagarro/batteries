Feature: Show battery size list empty

  Scenario: A message notifies there are no battery sizes
    Given I am a new, authenticated user
    When I click "Admin"
    And I click "Battery size"
    Then I should see "Battery size list"

