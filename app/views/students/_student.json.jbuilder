json.extract! student, :id, :cuid, :name, :program, :created_at, :updated_at
json.url student_url(student, format: :json)
