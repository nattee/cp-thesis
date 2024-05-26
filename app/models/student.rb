class Student < ApplicationRecord
  has_many :proposals
  belongs_to :program

  def has_active_proposal
    proposals.count > 0
  end

  def has_active_exam
    Exam.joins(:proposal).where('proposals.student': self).count > 0
  end
end
