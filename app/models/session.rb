class Session < ActiveRecord::Base
  validates_presence_of :title, :speaker
end
