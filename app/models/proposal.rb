class Proposal < ApplicationRecord
  belongs_to :student
  belongs_to :advisor, class_name: 'Faculty'
end
