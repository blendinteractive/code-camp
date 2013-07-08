Given(/^there are no upcoming sessions$/) do
end

Given(/^there are no upcoming speakers$/) do
end

Given(/^there are upcoming sessions$/) do
  Session.create!(:speaker =>"Rod Paddock", :title => "Intro to Rails", :abstract => "If you like asp.net mvc but want to write less code check this out")
  Session.create!(:speaker =>"Jason Bock", :title => "Metaprogramming .Net", :abstract => "Understanding the concepts, advantages, and pitfalls of metaprogramming")
end

Given(/^there are upcoming speakers$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I go to the sessions display page$/) do
  visit sessions_url
end

When(/^I go to the speakers display page$/) do
  visit speakers_url
end

Then(/^I should see "(.*?)"$/) do |text|
  page.should have_content(text)
end

Then(/^I should not see "(.*?)"$/) do |text|
  page.should have_no_content(text)
end
