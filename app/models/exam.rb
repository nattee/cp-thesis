class Exam < ApplicationRecord
  belongs_to :proposal
  require 'docx'
  require 'tempfile'

  def gen_docx_exam
    doc = Docx::Document.open('public/exam.docx')


    # add at bookmark
    doc.bookmarks['student_name'].insert_text_after(self.proposal.student.name)
    doc.bookmarks['student_name_2'].insert_text_after(self.proposal.student.name)
    doc.bookmarks['student_id'].insert_text_after(self.proposal.student.cuid)
    doc.bookmarks['student_id_2'].insert_text_after(self.proposal.student.cuid)
    doc.bookmarks['name_th'].insert_text_after(self.proposal.name_th)
    doc.bookmarks['name_th_2'].insert_text_after(self.proposal.name_th)
    doc.bookmarks['name_eng'].insert_text_after(self.proposal.name_en)
    doc.bookmarks['name_eng_2'].insert_text_after(self.proposal.name_en)
    doc.bookmarks['exam_day'].insert_text_after(self.exam_date.day)
    doc.bookmarks['exam_month'].insert_text_after(ApplicationController.helpers.thai_month(self.exam_date.month))
    doc.bookmarks['exam_year'].insert_text_after(self.exam_date.year+543)
    doc.bookmarks['exam_time'].insert_text_after(self.exam_date.strftime("%H:%M"))
    doc.bookmarks['exam_place'].insert_text_after(self.place)
    doc.bookmarks['com_chair'].insert_text_after(self.chair)
    doc.bookmarks['com_advisor'].insert_text_after(self.proposal.advisor.name)
    doc.bookmarks['com_1'].insert_text_after(self.com1) unless self.com1.blank?
    doc.bookmarks['com_2'].insert_text_after(self.com2) unless self.com2.blank?
    doc.bookmarks['com_ex'].insert_text_after(self.ex_com) unless self.ex_com.blank?

    doc.bookmarks['com_chair_2'].insert_text_after(self.chair)
    doc.bookmarks['com_advisor_2'].insert_text_after(self.proposal.advisor.name)
    doc.bookmarks['com_1_2'].insert_text_after(self.com1) unless self.com1.blank?
    doc.bookmarks['com_2_2'].insert_text_after(self.com2) unless self.com2.blank?
    doc.bookmarks['com_ex_2'].insert_text_after(self.ex_com) unless self.ex_com.blank?


    filename = "tmp/exam-#{id}.docx"
    doc.save(filename)
    return filename
  end

  def gen_docx_invitation(committee)
    doc = Docx::Document.open('public/invitation.docx')


    # add at bookmark
    doc.bookmarks['student_name'].insert_text_after(self.proposal.student.name)
    doc.bookmarks['student_id'].insert_text_after(self.proposal.student.cuid)
    doc.bookmarks['name_th'].insert_text_after(self.proposal.name_th)
    doc.bookmarks['exam_date'].insert_text_after(ApplicationController.helpers.thai_date(self.exam_date))
    doc.bookmarks['exam_date_2'].insert_text_after(ApplicationController.helpers.thai_date(self.exam_date))
    doc.bookmarks['exam_time'].insert_text_after(self.exam_date.strftime("%H:%M"))
    doc.bookmarks['com_advisor'].insert_text_after(self.proposal.advisor.name)
    doc.bookmarks['com_name'].insert_text_after(committee)
    doc.bookmarks['com_name_2'].insert_text_after(committee)



    filename = "tmp/invitation-#{id}-#{committee}.docx"
    doc.save(filename)
    return filename
  end

end
