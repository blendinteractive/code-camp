require 'test_helper'

class SessionTest < ActiveSupport::TestCase
  test "sessions should require a title" do
    speaker = Speaker.new firstname: "Jackson", lastname: "Harms", email: "jackson@blendisimo.com"
    speaker.save!
    session = Session.new :speaker => speaker, :abstract => "Testing with selenium"
    refute session.save, "Saved the session without a title"
    refute session.valid?
    assert session.errors.get(:title).any?
  end

  test "sessions should require a speaker" do
    session = Session.new :title => "How to train your dragon", :abstract => "Testing with selenium"
    refute session.save, "Saved the session without a speaker"
    refute session.valid?
  end
end
