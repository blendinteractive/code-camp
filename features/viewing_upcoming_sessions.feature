Feature: Viewing the upcoming sessions

  Scenario: No upcoming sessions
    Given there are no upcoming sessions
    When I go to the sessions display page
    Then I should see "No sessions"

  Scenario: There are upcoming sessions
    Given there are upcoming sessions
    When I go to the sessions display page
    Then I should see "session" items
    Then I should not see "No sessions"
