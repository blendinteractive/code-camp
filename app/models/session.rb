class Session < ActiveRecord::Base
  validates_presence_of :title, :speaker
  belongs_to :speaker
end
