Feature: Viewing the upcoming speakers

  Scenario: No upcoming speakers
    Given there are no upcoming speakers
    When I go to the speakers display page
    Then I should see "No speakers"

  Scenario: There are upcoming speakers
    Given there are upcoming speakers
    When I go to the speakers display page
    Then I should see "speaker" items
    Then I should not see "No speakers"
