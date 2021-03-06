Given(/^there are no upcoming sessions$/) do
end

Given(/^there are no upcoming speakers$/) do
end

Given(/^there are upcoming sessions$/) do
  create_speakers_and_sessions
end

Given(/^there are upcoming speakers$/) do
  create_speakers_and_sessions
end

When(/^I go to the sessions display page$/) do
  visit sessions_url
end

When(/^I go to the speakers display page$/) do
  visit speakers_url
end

Then(/^I should see "(.*?)"$/) do |text|
  assert page.has_content?(text)
end

Then(/^I should see "(.*?)" items$/) do |text|
  assert page.has_css?("."+text) || page.has_css?("#"+text)
end

Then(/^I should not see "(.*?)"$/) do |text|
  assert page.has_content?(text) == false
end

def create_speakers_and_sessions
  jackson = Speaker.create! :firstname => "Jackson", :lastname => "Harms", :email => "jackson@blendinteractive.com", :display => true
  tyler = Speaker.create! :firstname => "Tyler", :lastname => "Murtha", :email => "tyler.harms@gmail.com", :display => true
  Speaker.create! :firstname => "Seth", :lastname => "Larson", :email => "seth.larson@gmail.com", :display => false
  Session.create!(:speaker => jackson, :title => "Intro to Rails", :abstract => "If you like asp.net mvc but want to write less code check this out")
  Session.create!(:speaker => tyler, :title => "Metaprogramming .Net", :abstract => "Understanding the concepts, advantages, and pitfalls of metaprogramming")
end
