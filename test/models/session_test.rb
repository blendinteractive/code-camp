require 'test_helper'

class SessionTest < ActiveSupport::TestCase
  test "sessions should require a title" do
    session = Session.new :speaker => "Jackson Harms", :abstract => "Testing with selenium"
    refute session.save, "Saved the session without a title"
    refute session.valid?
    assert session.errors.get(:title).any?
  end
end
