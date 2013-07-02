Given(/^there are no upcoming sessions$/) do
end

When(/^I go to the sessions display page$/) do
  visit sessions_url
end

Then(/^I should see "(.*?)"$/) do |text|
  page.should have_content(text)
end
