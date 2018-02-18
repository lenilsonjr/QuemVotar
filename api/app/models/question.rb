class Question < ApplicationRecord

  validates_presence_of :title
  serialize :choices

end
