class Characteristic < ApplicationRecord
  belongs_to :candidate
  belongs_to :question
end
