class Proposal < ApplicationRecord
  belongs_to :student
  belongs_to :advisor, class_name: 'Faculty'

  def name
    return name_th
  end
end
