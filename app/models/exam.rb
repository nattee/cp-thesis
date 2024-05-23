class Exam < ApplicationRecord
  belongs_to :proposal
  require 'docx'

  def gen_docx_exam
    doc = Docx::Document.open('public/exam.docx')

    # add at bookmark
    doc.bookmarks['student_name'].insert_text_after(self.proposal.student.name)
    doc.bookmarks['student_id'].insert_text_after(self.proposal.student.cuid)

    doc.save('exam.docx')
  end

  def gen_docx_appointment(committee)
  end

end
