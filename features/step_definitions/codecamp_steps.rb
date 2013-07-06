Given(/^there are no upcoming sessions$/) do
  @sessions = []
end

Given(/^there are upcoming sessions$/) do
  Session.create!(:speaker =>"Rod Paddock", :title => "Intro to Rails", :abstract => "If you like asp.net mvc but want to write less code check this out")
  Session.create!(:speaker =>"Jason Bock", :title => "Metaprogramming .Net", :abstract => "Understanding the concepts, advantages, and pitfalls of metaprogramming")
end

When(/^I go to the sessions display page$/) do
  visit sessions_url
end

Then(/^I should see "(.*?)"$/) do |text|
  page.should have_content(text)
end

Then(/^I should see sessions$/) do
  puts "************************\n #{@sessions}\n********************\n"
  puts page.html
  page.should have_css(".session")
end
