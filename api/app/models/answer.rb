class Answer < ApplicationRecord

  serialize :answers
  #belongs_to :candidate, foreign_key: 'result_id'

end
