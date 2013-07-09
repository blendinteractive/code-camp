class Speaker < ActiveRecord::Base
  validates_presence_of :firstname, :lastname, :email
end
