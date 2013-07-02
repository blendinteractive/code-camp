Feature: Viewing the upcoming sessions

  Scenario: No upcoming sessions
    Given there are no upcoming sessions
    When I go to the sessions display page
    Then I should see "No sessions"
