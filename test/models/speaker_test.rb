require 'test_helper'

class SpeakerTest < ActiveSupport::TestCase
  test "speakers should require a first name" do
    speaker = Speaker.new lastname:  "Harms", email: "jackson@blendisimo.com",  display: true
    refute speaker.save, "Saved the speaker without a first name"
    refute speaker.valid?
    assert speaker.errors.get(:firstname).any?
  end

  test "speakers should require a last name" do
    speaker = Speaker.new firstname:  "Jackson", email: "jackson@blendisimo.com",  display: true
    refute speaker.save, "Saved the speaker without a last name"
    refute speaker.valid?
    assert speaker.errors.get(:lastname).any?
  end

  test "speakers should require a email" do
    speaker = Speaker.new firstname: "Jackson", lastname:  "Harms", display: true
    refute speaker.save, "Saved the speaker without an email"
    refute speaker.valid?, "Speaker was valid without an email"
    assert speaker.errors.get(:email).any?, "Speaker did not have any email related errors with no email specified"
  end

  test "speakers display should be false by default" do
    speaker = Speaker.new firstname: "Jackson", lastname: "Harms", email: "jackson@blendisimo.com"
    assert speaker.save, "Failed to save speaker without display set"
    refute speaker.display, "Speaker display defaulted to true"
    assert speaker.valid?, "Speaker was not valid with display not manually set"
  end
end
