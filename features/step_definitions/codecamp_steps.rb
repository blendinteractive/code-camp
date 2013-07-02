Given(/^there are no upcoming sessions$/) do
end

When(/^I go to the sessions display page$/) do
  visit sessions_url
end

Then(/^I should see that there are no sessions$/) do
  page.should have_content("No sessions")
  page.should have_content("Submit a session")
end
