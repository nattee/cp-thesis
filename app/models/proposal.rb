class Proposal < ApplicationRecord
  belongs_to :student
  belongs_to :advisor, class_name: 'Faculty'

  has_one_attached :file

  def name
    return name_th
  end
end
